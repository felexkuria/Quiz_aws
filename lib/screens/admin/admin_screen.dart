import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../model/question.dart';

class AdminPanel extends StatefulWidget {
  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  final _formKey = GlobalKey<FormState>();
  final _questionController = TextEditingController();
  final List<TextEditingController> _optionControllers =
      List.generate(4, (i) => TextEditingController());
  int _correctAnswer = 0;
  String _selectedDomain = 'Cloud Concepts';

  final List<String> domains = [
    'Cloud Concepts',
    'Security and Compliance',
    'Technology',
    'Billing and Pricing'
  ];

  void _addQuestion() async {
    if (_formKey.currentState!.validate()) {
      Question newQuestion = Question(
        questionText: _questionController.text,
        options: _optionControllers.map((c) => c.text).toList(),
        correctAnswer: _optionControllers[_correctAnswer].text,
      );

      await FirebaseFirestore.instance.collection('questions').doc().set({
        'questionText': newQuestion.questionText,
        'options': newQuestion.options,
        'correctAnswer': newQuestion.correctAnswer,
        'domain': _selectedDomain,
        'createdAt': FieldValue.serverTimestamp(),
      });

      _clearForm();
    }
  }

  void _clearForm() {
    _questionController.clear();
    for (var controller in _optionControllers) {
      controller.clear();
    }
    setState(() {
      _correctAnswer = 0;
      _selectedDomain = 'Cloud Concepts';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Panel'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<String>(
                value: _selectedDomain,
                decoration: const InputDecoration(labelText: 'Domain'),
                items: domains.map((String domain) {
                  return DropdownMenuItem(
                    value: domain,
                    child: Text(domain),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedDomain = newValue!;
                  });
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _questionController,
                decoration: const InputDecoration(labelText: 'Question'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a question';
                  }
                  return null;
                },
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              ...List.generate(4, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _optionControllers[index],
                          decoration: InputDecoration(
                            labelText: 'Option ${index + 1}',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter option ${index + 1}';
                            }
                            return null;
                          },
                        ),
                      ),
                      Radio<int>(
                        value: index,
                        groupValue: _correctAnswer,
                        onChanged: (int? value) {
                          setState(() {
                            _correctAnswer = value!;
                          });
                        },
                      ),
                    ],
                  ),
                );
              }),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: _addQuestion,
                  child: const Text('Add Question'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _questionController.dispose();
    for (var controller in _optionControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
