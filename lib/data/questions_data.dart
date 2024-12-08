import '../model/question.dart';

List<Question> dummyQuestions = [
  // Domain 1: Cloud Concepts
  Question(
    questionText: "What is the AWS Cloud?",
    options: [
      'A. A global network of data centers that provide on-demand computing power',
      'B. A software development tool for building mobile apps',
      'C. A system for managing on-premises IT infrastructure',
      'D. A platform for hosting web servers only',
    ],
    correctAnswer:
        'A. A global network of data centers that provide on-demand computing power',
  ),
  Question(
    questionText: "Which of the following is a key benefit of cloud computing?",
    options: [
      'A. Flexibility to scale computing resources based on demand',
      'B. The need to purchase all hardware upfront',
      'C. The necessity to manage on-premises servers',
      'D. Fixed pricing regardless of usage',
    ],
    correctAnswer:
        'A. Flexibility to scale computing resources based on demand',
  ),
  Question(
    questionText: "What is the purpose of virtualization in the cloud?",
    options: [
      'A. To manage billing and account permissions',
      'B. To increase physical hardware requirements',
      'C. To run multiple virtual machines on physical hardware',
      'D. To provide a fixed amount of computing power to each customer',
    ],
    correctAnswer: 'C. To run multiple virtual machines on physical hardware',
  ),

  // Domain 2: Security and Compliance
  Question(
    questionText:
        "What is the primary purpose of AWS Identity and Access Management (IAM)?",
    options: [
      'A. To create and manage users and permissions for AWS resources',
      'B. To manage network security for AWS resources',
      'C. To monitor the usage of AWS services',
      'D. To handle billing and cost management',
    ],
    correctAnswer:
        'A. To create and manage users and permissions for AWS resources',
  ),
  Question(
    questionText: "Which of the following is a security best practice in AWS?",
    options: [
      'A. Use the root account for everyday tasks',
      'B. Enable Multi-Factor Authentication (MFA) on your AWS account',
      'C. Store access keys in plain text',
      'D. Share credentials between team members for convenience',
    ],
    correctAnswer:
        'B. Enable Multi-Factor Authentication (MFA) on your AWS account',
  ),
  Question(
    questionText:
        "Which AWS service provides detailed monitoring and logging for security and compliance auditing?",
    options: [
      'A. AWS CloudTrail',
      'B. AWS Lambda',
      'C. Amazon EC2',
      'D. AWS Elastic Load Balancing',
    ],
    correctAnswer: 'A. AWS CloudTrail',
  ),

  // Domain 3: Technology
  Question(
    questionText:
        "Which AWS service is designed to provide scalable object storage?",
    options: [
      'A. Amazon EC2',
      'B. AWS Lambda',
      'C. Amazon S3',
      'D. Amazon RDS',
    ],
    correctAnswer: 'C. Amazon S3',
  ),
  Question(
    questionText:
        "Which service would you use to launch and manage virtual servers in AWS?",
    options: [
      'A. Amazon RDS',
      'B. AWS Lambda',
      'C. Amazon EC2',
      'D. AWS CloudFormation',
    ],
    correctAnswer: 'C. Amazon EC2',
  ),
  Question(
    questionText:
        "Which AWS service helps you automatically scale your compute capacity based on demand?",
    options: [
      'A. AWS Auto Scaling',
      'B. AWS CloudFormation',
      'C. Amazon S3',
      'D. Amazon EC2',
    ],
    correctAnswer: 'A. AWS Auto Scaling',
  ),

  // Domain 4: Billing and Pricing
  Question(
    questionText:
        "Which of the following AWS pricing models is based on usage?",
    options: [
      'A. Reserved pricing',
      'B. Pay-as-you-go pricing',
      'C. Spot pricing',
      'D. Subscription-based pricing',
    ],
    correctAnswer: 'B. Pay-as-you-go pricing',
  ),
  Question(
    questionText:
        "Which AWS service helps you monitor and control your AWS spending?",
    options: [
      'A. AWS Cost Explorer',
      'B. Amazon EC2',
      'C. AWS CloudFormation',
      'D. AWS Lambda',
    ],
    correctAnswer: 'A. AWS Cost Explorer',
  ),
  Question(
    questionText: "What is the AWS Free Tier?",
    options: [
      'A. A limited-time offer that provides free access to specific AWS services',
      'B. A set of resources offered for free during the first year of account creation',
      'C. A pricing plan for advanced AWS features',
      'D. A feature for handling data encryption at no cost',
    ],
    correctAnswer:
        'B. A set of resources offered for free during the first year of account creation',
  ),
];
