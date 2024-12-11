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

  // Domain 5: Additional Questions (Your Provided Questions)
  Question(
    questionText: "What is the purpose of the AWS Shared Responsibility Model?",
    options: [
      'A. To define the security responsibilities between AWS and the customer',
      'B. To assign responsibility for data storage security',
      'C. To specify which network protocols AWS supports',
      'D. To help customers manage third-party software licenses',
    ],
    correctAnswer:
        'A. To define the security responsibilities between AWS and the customer',
  ),
  Question(
    questionText:
        "Which of the following AWS services can help secure your AWS infrastructure?",
    options: [
      'A. AWS Shield',
      'B. AWS CloudFront',
      'C. Amazon S3',
      'D. AWS IoT Core',
    ],
    correctAnswer: 'A. AWS Shield',
  ),
  Question(
    questionText:
        "Which AWS service is used for provisioning and managing a collection of AWS resources?",
    options: [
      'A. AWS CloudFormation',
      'B. Amazon EC2',
      'C. Amazon S3',
      'D. AWS Lambda',
    ],
    correctAnswer: 'A. AWS CloudFormation',
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

  // Domain 1: Cloud Concepts
  Question(
    questionText:
        "Which of the following best describes the shared responsibility model in AWS?",
    options: [
      'A. AWS manages all aspects of security and compliance',
      'B. The customer is responsible for physical security',
      'C. AWS manages security of the cloud, and the customer manages security in the cloud',
      'D. The customer is responsible for infrastructure security',
    ],
    correctAnswer:
        'C. AWS manages security of the cloud, and the customer manages security in the cloud',
  ),
  Question(
    questionText:
        "Which AWS service is used to deploy and manage containerized applications?",
    options: [
      'A. Amazon EC2',
      'B. AWS Lambda',
      'C. Amazon ECS',
      'D. Amazon RDS',
    ],
    correctAnswer: 'C. Amazon ECS',
  ),
  Question(
    questionText: "What is Amazon CloudFront?",
    options: [
      'A. A content delivery network (CDN) service',
      'B. A compute service for running code',
      'C. A relational database service',
      'D. A storage service for long-term backups',
    ],
    correctAnswer: 'A. A content delivery network (CDN) service',
  ),
  Question(
    questionText:
        "Which AWS service allows you to monitor your AWS resources in real-time?",
    options: [
      'A. AWS CloudWatch',
      'B. AWS Lambda',
      'C. Amazon EC2',
      'D. AWS CloudFormation',
    ],
    correctAnswer: 'A. AWS CloudWatch',
  ),
  Question(
    questionText:
        "Which AWS service is used to create and manage virtual private networks (VPNs)?",
    options: [
      'A. Amazon VPC',
      'B. AWS Direct Connect',
      'C. AWS VPN',
      'D. AWS CloudFormation',
    ],
    correctAnswer: 'A. Amazon VPC',
  ),
  Question(
    questionText:
        "Which AWS service helps manage user identities and permissions for AWS resources?",
    options: [
      'A. AWS IAM',
      'B. AWS Lambda',
      'C. Amazon EC2',
      'D. AWS CloudTrail',
    ],
    correctAnswer: 'A. AWS IAM',
  ),
  Question(
    questionText:
        "Which AWS service enables you to store and retrieve any amount of data at any time?",
    options: [
      'A. Amazon S3',
      'B. AWS CloudFormation',
      'C. Amazon EC2',
      'D. AWS Lambda',
    ],
    correctAnswer: 'A. Amazon S3',
  ),
  Question(
    questionText: "What does Amazon RDS stand for?",
    options: [
      'A. Amazon Resilient Database Service',
      'B. Amazon Relational Database Service',
      'C. Amazon Redundant Data Service',
      'D. Amazon Resource Data Service',
    ],
    correctAnswer: 'B. Amazon Relational Database Service',
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
  Question(
    questionText:
        "Which service helps protect AWS resources from DDoS attacks?",
    options: [
      'A. AWS WAF',
      'B. AWS Shield',
      'C. AWS KMS',
      'D. AWS GuardDuty',
    ],
    correctAnswer: 'B. AWS Shield',
  ),
  Question(
    questionText: "What is AWS Key Management Service (KMS)?",
    options: [
      'A. A service for deploying applications to multiple regions',
      'B. A service to create and manage encryption keys',
      'C. A security service for monitoring suspicious activity',
      'D. A tool for setting up automated backups',
    ],
    correctAnswer: 'B. A service to create and manage encryption keys',
  ),
  Question(
    questionText:
        "Which AWS service allows you to manage and rotate encryption keys for your applications?",
    options: [
      'A. AWS Secrets Manager',
      'B. AWS KMS',
      'C. Amazon RDS',
      'D. AWS CloudHSM',
    ],
    correctAnswer: 'B. AWS KMS',
  ),
  Question(
    questionText:
        "Which AWS service helps you detect malicious activity in your AWS environment?",
    options: [
      'A. AWS Inspector',
      'B. AWS GuardDuty',
      'C. AWS Config',
      'D. AWS WAF',
    ],
    correctAnswer: 'B. AWS GuardDuty',
  ),
  Question(
    questionText: "What is the purpose of AWS Config?",
    options: [
      'A. To monitor network performance',
      'B. To track changes to AWS resources and their configuration',
      'C. To manage user permissions',
      'D. To automate the deployment of applications',
    ],
    correctAnswer:
        'B. To track changes to AWS resources and their configuration',
  ),
  Question(
    questionText: "What is Amazon Cognito used for?",
    options: [
      'A. To manage encryption keys',
      'B. To provide authentication and authorization for web and mobile apps',
      'C. To monitor AWS resources',
      'D. To manage cost and usage data',
    ],
    correctAnswer:
        'B. To provide authentication and authorization for web and mobile apps',
  ),
  Question(
    questionText:
        "Which AWS service provides a centralized platform for managing security across AWS accounts?",
    options: [
      'A. AWS Organizations',
      'B. AWS Security Hub',
      'C. AWS IAM',
      'D. AWS CloudTrail',
    ],
    correctAnswer: 'B. AWS Security Hub',
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
  Question(
    questionText: "What is Amazon Elastic Load Balancing (ELB)?",
    options: [
      'A. A service to monitor AWS resource usage',
      'B. A service to distribute traffic across multiple EC2 instances',
      'C. A service for managing domain names',
      'D. A service for encrypting network traffic',
    ],
    correctAnswer:
        'B. A service to distribute traffic across multiple EC2 instances',
  ),
  Question(
    questionText: "Which AWS service is used for serverless compute?",
    options: [
      'A. AWS Lambda',
      'B. Amazon EC2',
      'C. Amazon S3',
      'D. Amazon RDS',
    ],
    correctAnswer: 'A. AWS Lambda',
  ),
  Question(
    questionText:
        "Which AWS service helps to store and retrieve any amount of data at any time?",
    options: [
      'A. Amazon S3',
      'B. Amazon EC2',
      'C. Amazon RDS',
      'D. AWS CloudFormation',
    ],
    correctAnswer: 'A. Amazon S3',
  ),
  Question(
    questionText: "What does the 'AWS Shared Responsibility Model' define?",
    options: [
      'A. It defines the security of the cloud infrastructure and the customer’s responsibilities',
      'B. It defines the pricing structure for AWS services',
      'C. It defines the support options available for AWS customers',
      'D. It defines the way to deploy serverless applications on AWS',
    ],
    correctAnswer:
        'A. It defines the security of the cloud infrastructure and the customer’s responsibilities',
  ),
  Question(
    questionText:
        "Which AWS service helps you migrate applications to the cloud?",
    options: [
      'A. AWS Snowball',
      'B. AWS DMS',
      'C. AWS CloudFormation',
      'D. AWS Backup',
    ],
    correctAnswer: 'B. AWS DMS',
  ),
  Question(
    questionText: "What is AWS Elastic Beanstalk used for?",
    options: [
      'A. To run machine learning models',
      'B. To manage cloud storage',
      'C. To deploy and manage applications without worrying about infrastructure',
      'D. To manage user permissions and access',
    ],
    correctAnswer:
        'C. To deploy and manage applications without worrying about infrastructure',
  ),
  Question(
    questionText: "What is the AWS CloudFormation used for?",
    options: [
      'A. Automating resource provisioning and management through code',
      'B. Enabling serverless computing on AWS',
      'C. Monitoring AWS resource health and usage',
      'D. Storing and managing backups of AWS resources',
    ],
    correctAnswer:
        'A. Automating resource provisioning and management through code',
  ),

  // Domain 2: Security and Compliance
  Question(
    questionText: "What is the purpose of AWS Shield?",
    options: [
      'A. To protect applications from DDoS attacks',
      'B. To provide identity and access management',
      'C. To encrypt data in transit',
      'D. To monitor AWS resource usage',
    ],
    correctAnswer: 'A. To protect applications from DDoS attacks',
  ),
  Question(
    questionText:
        "Which service is used to monitor and log API activity in AWS?",
    options: [
      'A. AWS CloudTrail',
      'B. AWS CloudWatch',
      'C. AWS X-Ray',
      'D. AWS Config',
    ],
    correctAnswer: 'A. AWS CloudTrail',
  ),
  Question(
    questionText:
        "Which AWS service is used for providing centralized identity management?",
    options: [
      'A. AWS IAM',
      'B. AWS Organizations',
      'C. Amazon Cognito',
      'D. AWS WAF',
    ],
    correctAnswer: 'A. AWS IAM',
  ),
  Question(
    questionText: "What is the purpose of AWS Secrets Manager?",
    options: [
      'A. To store sensitive information such as passwords and API keys',
      'B. To monitor user activity across AWS',
      'C. To encrypt data at rest',
      'D. To scale infrastructure automatically',
    ],
    correctAnswer:
        'A. To store sensitive information such as passwords and API keys',
  ),
  Question(
    questionText:
        "Which of the following is a best practice for securing AWS resources?",
    options: [
      'A. Use a root account for all tasks',
      'B. Enable Multi-Factor Authentication (MFA)',
      'C. Share access keys across teams',
      'D. Use public IP addresses for all instances',
    ],
    correctAnswer: 'B. Enable Multi-Factor Authentication (MFA)',
  ),

  // Domain 3: Technology
  Question(
    questionText: "What is the AWS Lambda service used for?",
    options: [
      'A. To run serverless applications and code',
      'B. To manage virtual servers',
      'C. To store and manage data',
      'D. To automate resource scaling',
    ],
    correctAnswer: 'A. To run serverless applications and code',
  ),
  Question(
    questionText:
        "Which AWS service provides a managed relational database solution?",
    options: [
      'A. Amazon EC2',
      'B. Amazon RDS',
      'C. AWS Lambda',
      'D. Amazon S3',
    ],
    correctAnswer: 'B. Amazon RDS',
  ),
  Question(
    questionText:
        "Which AWS service enables content delivery via a global network of edge locations?",
    options: [
      'A. AWS CloudFront',
      'B. AWS Lambda',
      'C. AWS S3',
      'D. AWS Direct Connect',
    ],
    correctAnswer: 'A. AWS CloudFront',
  ),
  Question(
    questionText:
        "Which of the following is a fully managed Kubernetes service in AWS?",
    options: [
      'A. AWS Lambda',
      'B. Amazon EKS',
      'C. AWS ECS',
      'D. Amazon EC2',
    ],
    correctAnswer: 'B. Amazon EKS',
  ),
  Question(
    questionText:
        "Which AWS service helps you monitor the performance of applications and infrastructure in real-time?",
    options: [
      'A. AWS CloudWatch',
      'B. AWS X-Ray',
      'C. Amazon EC2',
      'D. Amazon S3',
    ],
    correctAnswer: 'A. AWS CloudWatch',
  ),
  Question(
    questionText: "What is Amazon EC2 used for?",
    options: [
      'A. Hosting web applications',
      'B. Launching virtual servers in the cloud',
      'C. Storing files in the cloud',
      'D. Running serverless functions',
    ],
    correctAnswer: 'B. Launching virtual servers in the cloud',
  ),
  Question(
    questionText: "What AWS service provides fast, scalable file storage?",
    options: [
      'A. Amazon S3',
      'B. Amazon EFS',
      'C. Amazon RDS',
      'D. AWS Lambda',
    ],
    correctAnswer: 'B. Amazon EFS',
  ),
  Question(
    questionText:
        "Which AWS service is used to automate infrastructure deployment?",
    options: [
      'A. AWS CloudFormation',
      'B. AWS EC2',
      'C. AWS CodeDeploy',
      'D. AWS Lambda',
    ],
    correctAnswer: 'A. AWS CloudFormation',
  ),

  // Domain 4: Billing and Pricing
  Question(
    questionText: "Which of the following is a benefit of the AWS Free Tier?",
    options: [
      'A. Free access to all AWS services for one year',
      'B. Free access to select AWS services with usage limits',
      'C. Free access to AWS support plans',
      'D. Free training for AWS certifications',
    ],
    correctAnswer: 'B. Free access to select AWS services with usage limits',
  ),
  Question(
    questionText:
        "Which AWS service helps you estimate your AWS usage and costs?",
    options: [
      'A. AWS Cost Explorer',
      'B. AWS CloudWatch',
      'C. AWS Budgets',
      'D. AWS Pricing Calculator',
    ],
    correctAnswer: 'D. AWS Pricing Calculator',
  ),
  Question(
    questionText: "What is the AWS Pricing Calculator used for?",
    options: [
      'A. To estimate the cost of AWS services based on usage',
      'B. To generate invoices for AWS services',
      'C. To automate cost optimization',
      'D. To manage subscription fees',
    ],
    correctAnswer: 'A. To estimate the cost of AWS services based on usage',
  ),
];
