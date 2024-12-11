import '../model/question.dart';

List<Question> practiceQuestions = [
  // Domain: AWS Cost Management
  Question(
    questionText:
        "What is a benefit of using AWS Cost Allocation Tags for managing AWS costs?",
    options: [
      'A. Granular cost allocation',
      'B. Integration with third-party billing tools',
      'C. Automated resource provisioning',
      'D. Real-time cost monitoring',
    ],
    correctAnswer: 'A. Granular cost allocation',
  ),

  // Domain: Media Services
  Question(
    questionText:
        "What are benefits of using AWS Elemental MediaTailor for server-side ad insertion in video streams?",
    options: [
      'A. Integration with third-party monitoring tools',
      'B. Personalized ad insertion',
      'C. Support for real-time data processing',
      'D. Support for long-running applications',
    ],
    correctAnswer: 'B. Personalized ad insertion',
  ),

  // Domain: Database Services
  Question(
    questionText: "What is a characteristic of Amazon Neptune?",
    options: [
      'A. It provides relational database services',
      'B. It focuses on real-time data processing',
      'C. It offers serverless computing capabilities',
      'D. It is a fully managed graph database service',
    ],
    correctAnswer: 'D. It is a fully managed graph database service',
  ),

  // Domain: Developer Tools
  Question(
    questionText: "What is a primary feature of AWS CodeBuild?",
    options: [
      'A. Infrastructure provisioning',
      'B. Source control integration',
      'C. Fully managed build service',
      'D. Code reviews and collaboration',
    ],
    correctAnswer: 'C. Fully managed build service',
  ),

  // Domain: Security and Compliance
  Question(
    questionText: "What is one aspect of the AWS Shared Responsibility Model?",
    options: [
      'A. Customers are responsible for monitoring AWS network traffic',
      'B. AWS is responsible for customer data protection',
      'C. AWS is responsible for the security of the cloud infrastructure',
      'D. Customers are responsible for physical security at AWS data centers',
    ],
    correctAnswer:
        'C. AWS is responsible for the security of the cloud infrastructure',
  ),

  // Domain: AWS Security Tools
  Question(
    questionText:
        "Which AWS service provides a managed firewall service to protect web applications from common web exploits?",
    options: [
      'A. Amazon Macie',
      'B. AWS Security Hub',
      'C. AWS WAF',
      'D. Amazon GuardDuty',
    ],
    correctAnswer: 'C. AWS WAF',
  ),

  // Domain: Networking Services
  Question(
    questionText:
        "What AWS service enables customers to route traffic to different endpoints based on request attributes?",
    options: [
      'A. AWS Lambda',
      'B. Amazon Route 53',
      'C. Amazon RDS',
      'D. Amazon DynamoDB',
    ],
    correctAnswer: 'B. Amazon Route 53',
  ),

  // Domain: Licensing and Cost Management
  Question(
    questionText:
        "What is a licensing strategy commonly used for running Windows Server workloads on AWS?",
    options: [
      'A. On-Demand Instances',
      'B. Reserved Instances',
      'C. Pay-as-you-go',
      'D. Bring Your Own License (BYOL)',
    ],
    correctAnswer: 'D. Bring Your Own License (BYOL)',
  ),

  // Domain: AWS Best Practices
  Question(
    questionText:
        "Why is it recommended to create individual IAM users instead of using the root user for everyday tasks?",
    options: [
      'A. To automate network configuration',
      'B. To maintain security best practices',
      'C. To reduce administrative overhead',
      'D. To simplify billing processes',
    ],
    correctAnswer: 'B. To maintain security best practices',
  ),

  // Domain: Data Warehousing
  Question(
    questionText:
        "What are benefits of using Amazon Redshift for data warehousing?",
    options: [
      'A. Support for long-running applications',
      'B. Support for real-time data processing',
      'C. Scalability for large-scale data analysis',
      'D. Integration with third-party monitoring tools',
    ],
    correctAnswer: 'C. Scalability for large-scale data analysis',
  ),

  // Domain: AWS Resource for Cloud Migration
  Question(
    questionText:
        "What is the function of AWS Application Migration Service (MGN) in cloud migration?",
    options: [
      'A. Managing cloud resources',
      'B. Building serverless applications',
      'C. Automating the migration of on-premises applications to AWS',
      'D. Hybrid cloud connectivity',
    ],
    correctAnswer:
        'C. Automating the migration of on-premises applications to AWS',
  ),

  // Domain: AWS Shared Responsibility Model
  Question(
    questionText:
        "What aspect of security does AWS manage in the Shared Responsibility Model?",
    options: [
      'A. Configuration management of customer applications',
      'B. Data classification and labeling',
      'C. Physical security of data centers',
      'D. Access control for customer accounts',
    ],
    correctAnswer: 'C. Physical security of data centers',
  ),

  // Domain: Amazon ECS
  Question(
    questionText: "What is Amazon ECS (Elastic Container Service)?",
    options: [
      'A. A fully managed container orchestration service',
      'B. A virtual private server hosting service',
      'C. A managed database service',
      'D. A machine learning platform',
    ],
    correctAnswer: 'A. A fully managed container orchestration service',
  ),

  // Domain: AWS Analytics Services
  Question(
    questionText:
        "Which AWS service enables customers to set up real-time data streaming and analytics?",
    options: [
      'A. Amazon EMR',
      'B. Amazon Kinesis',
      'C. Amazon QuickSight',
      'D. Amazon Athena',
    ],
    correctAnswer: 'B. Amazon Kinesis',
  ),

  // Domain: Cloud Computing
  Question(
    questionText:
        "What is a benefit of using AWS Lambda for serverless computing?",
    options: [
      'A. Provisioning virtual machines for application deployment',
      'B. Reduced operational overhead',
      'C. Managing server uptime and availability',
      'D. Support for long-running applications',
    ],
    correctAnswer: 'B. Reduced operational overhead',
  ),

  // Domain: AWS Security Best Practices
  Question(
    questionText:
        "What is the risk of leaving the root user credentials unprotected?",
    options: [
      'A. Increased availability of services',
      'B. Unauthorized access to sensitive data',
      'C. Reduced administrative control',
      'D. Enhanced compliance with regulations',
    ],
    correctAnswer: 'B. Unauthorized access to sensitive data',
  ),

  // Domain: AWS Database Services
  Question(
    questionText:
        "Which AWS service provides a fully managed, scalable NoSQL database service for applications that need consistent, single-digit millisecond latency at any scale?",
    options: [
      'A. Amazon Aurora',
      'B. Amazon Redshift',
      'C. Amazon DynamoDB',
      'D. Amazon DocumentDB',
    ],
    correctAnswer: 'C. Amazon DynamoDB',
  ),

  // Domain: AWS Services
  Question(
    questionText:
        "Which AWS service allows you to automatically adjust the number of compute resources to match demand?",
    options: [
      'A. Simple Token Service (STS)',
      'B. AWS Autoscaling',
      'C. Amazon Cognito',
      'D. Fargate',
    ],
    correctAnswer: 'B. AWS Autoscaling',
  ),

  // Domain: AWS Compliance and Governance
  Question(
    questionText: "What is AWS Key Management Service (KMS)?",
    options: [
      'A. A content delivery network (CDN)',
      'B. A serverless compute service',
      'C. A service for managing encryption keys',
      'D. A managed database service',
    ],
    correctAnswer: 'C. A service for managing encryption keys',
  ),

  // Domain: Media Services
  Question(
    questionText:
        "What are the benefits of using AWS Elemental MediaPackage for video packaging and origination?",
    options: [
      'A. Scalability and elasticity',
      'B. Support for real-time data processing',
      'C. Dynamic video packaging and encryption',
      'D. Support for long-running applications',
    ],
    correctAnswer: 'A. Scalability and elasticity',
  ),

  // Domain: AWS Analytics Services
  Question(
    questionText:
        "Which AWS service enables users to easily collect, process, and analyze video and data streams in real time?",
    options: [
      'A. Amazon Redshift',
      'B. Amazon Kinesis',
      'C. Amazon DynamoDB',
      'D. Amazon QuickSight',
    ],
    correctAnswer: 'B. Amazon Kinesis',
  ),

  // Domain: AWS Management Tools
  Question(
    questionText:
        "What AWS service provides a central repository for managing and versioning AWS resource configurations?",
    options: [
      'A. AWS Control Tower',
      'B. AWS Systems Manager',
      'C. AWS Config',
      'D. AWS CloudFormation',
    ],
    correctAnswer: 'C. AWS Config',
  ),

  // Domain: Machine Learning
  Question(
    questionText:
        "What are the benefits of using Amazon Fraud Detector for fraud detection?",
    options: [
      'A. Scalability and elasticity',
      'B. Integration with third-party monitoring tools',
      'C. Support for long-running applications',
      'D. Machine learning powered fraud detection',
    ],
    correctAnswer: 'D. Machine learning powered fraud detection',
  ),

  // Domain: AWS Security Best Practices
  Question(
    questionText:
        "What are the consequences of using the root user for day-to-day tasks in an AWS account?",
    options: [
      'A. Reduced administrative overhead',
      'B. Increased security risks',
      'C. Enhanced automation capabilities',
      'D. Improved compliance with regulations',
    ],
    correctAnswer: 'B. Increased security risks',
  ),

  // Domain: AWS Analytics Services
  Question(
    questionText:
        "What AWS service allows users to query data stored in Amazon S3 using standard SQL?",
    options: [
      'A. Amazon Athena',
      'B. Amazon QuickSight',
      'C. Amazon EMR',
      'D. Amazon Kinesis',
    ],
    correctAnswer: 'A. Amazon Athena',
  ),

  // Domain: Types of Cloud Deployment Models
  Question(
    questionText: "Define the following cloud deployment model: Hybrid Cloud.",
    options: [
      'A. A deployment model that exclusively uses on-premises infrastructure without leveraging cloud services.',
      'B. A deployment model where resources are isolated from the internet and accessible only via dedicated network connections.',
      'C. A deployment model that combines elements of both public and private clouds.',
      'D. A deployment model that does not allow for scalability or elasticity.',
    ],
    correctAnswer:
        'C. A deployment model that combines elements of both public and private clouds.',
  ),

  // Domain: AWS Shared Responsibility Model
  Question(
    questionText:
        "What is the role of customers in the AWS Shared Responsibility Model?",
    options: [
      'A. Maintaining physical security at AWS data centers',
      'B. Protecting their data in the cloud',
      'C. Securing the underlying cloud infrastructure',
      'D. Monitoring AWS network traffic',
    ],
    correctAnswer: 'B. Protecting their data in the cloud',
  ),

  // Domain: AWS Secrets Manager
  Question(
    questionText: "What type of secrets can be stored in AWS Secrets Manager?",
    options: [
      'A. Database credentials, API keys, and encryption keys',
      'B. Public DNS records',
      'C. Website content and assets',
      'D. Operating system images and installation files',
    ],
    correctAnswer: 'A. Database credentials, API keys, and encryption keys',
  ),

  // Domain: Understanding AWS Cloud Costs, Economics, and Billing Practices
  Question(
    questionText:
        "What is a benefit of using the Bring Your Own License (BYOL) strategy for running software on AWS?",
    options: [
      'A. Cost savings on licensing fees',
      'B. Automated resource provisioning',
      'C. Increased scalability',
      'D. Pay-as-you-go pricing',
    ],
    correctAnswer: 'A. Cost savings on licensing fees',
  ),

  // Domain: AWS Analytics Services
  Question(
    questionText:
        "Which AWS service provides serverless extract, transform, and load (ETL) for data lakes?",
    options: [
      'A. Amazon EMR',
      'B. Amazon Redshift',
      'C. AWS Glue',
      'D. Amazon QuickSight',
    ],
    correctAnswer: 'C. AWS Glue',
  ),

  // Domain: AWS Compliance and Governance
  Question(
    questionText: "What is a key benefit of using AWS Audit Manager?",
    options: [
      'A. Real-time network monitoring',
      'B. Automated resource provisioning',
      'C. Continuous compliance monitoring',
      'D. AI-powered anomaly detection',
    ],
    correctAnswer: 'C. Continuous compliance monitoring',
  ),

  // Domain: AWS Compliance and Governance
  Question(
    questionText: "What is AWS Security Hub?",
    options: [
      'A. A content delivery network (CDN)',
      'B. A data warehousing service',
      'C. A serverless compute service',
      'D. A comprehensive security and compliance service',
    ],
    correctAnswer: 'D. A comprehensive security and compliance service',
  ),

  // Domain: Understanding AWS Cloud Costs, Economics, and Billing Practices
  Question(
    questionText: "What is a characteristic of Spot Instances on AWS?",
    options: [
      'A. Predictable pricing',
      'B. Fixed pricing',
      'C. Variable pricing based on supply and demand',
      'D. Usage-based pricing',
    ],
    correctAnswer: 'C. Variable pricing based on supply and demand',
  ),

  // Domain: AWS Management Tools
  Question(
    questionText:
        "What AWS service provides a centralized dashboard for monitoring and managing AWS billing and cost optimization?",
    options: [
      'A. AWS Cost Explorer',
      'B. Amazon Inspector',
      'C. AWS CloudTrail',
      'D. AWS Trusted Advisor',
    ],
    correctAnswer: 'A. AWS Cost Explorer',
  ),

  // Domain: Machine Learning
  Question(
    questionText:
        "What are features of Amazon Translate for language translation?",
    options: [
      'A. Integration with third-party monitoring tools',
      'B. Support for long-running applications',
      'C. Text translation between languages',
      'D. Real-time data processing',
    ],
    correctAnswer: 'C. Text translation between languages',
  ),

  // Domain: AWS Messaging Services
  Question(
    questionText:
        "Which AWS service enables applications to send notifications to subscribing endpoints via SMS, email, or push notifications?",
    options: [
      'A. Amazon Simple Queue Service (Amazon SQS)',
      'B. Amazon S3',
      'C. Amazon Simple Notification Service (Amazon SNS)',
      'D. Amazon EventBridge',
    ],
    correctAnswer: 'C. Amazon Simple Notification Service (Amazon SNS)',
  ),

  // Domain: AWS Management Tools
  Question(
    questionText:
        "What AWS service provides a single console for managing AWS resources and applications from a unified interface?",
    options: [
      'A. AWS Systems Manager',
      'B. AWS CloudFormation',
      'C. AWS Amplify',
      'D. AWS Management Console',
    ],
    correctAnswer: 'D. AWS Management Console',
  ),

  // Domain: AWS Database Services
  Question(
    questionText: "What is a characteristic of Amazon Redshift?",
    options: [
      'A. It provides relational database services',
      'B. It is designed for distributed file storage',
      'C. It offers serverless computing capabilities',
      'D. It is a fully managed data warehousing service',
    ],
    correctAnswer: 'D. It is a fully managed data warehousing service',
  ),

  // Domain: AWS Compute Services
  Question(
    questionText:
        "What AWS service enables customers to launch virtual machines in the cloud?",
    options: [
      'A. Amazon S3',
      'B. Amazon EC2',
      'C. AWS Lambda',
      'D. Amazon RDS',
    ],
    correctAnswer: 'B. Amazon EC2',
  ),

  // Domain: AWS Developer Tools
  Question(
    questionText:
        "Which AWS service provides a fully managed service for building, testing, and deploying code to AWS services and on-premises systems?",
    options: [
      'A. AWS CodeCommit',
      'B. AWS CodeBuild',
      'C. AWS CodeArtifact',
      'D. AWS CodePipeline',
    ],
    correctAnswer: 'B. AWS CodeBuild',
  ),

  // Domain: AWS Management Tools
  Question(
    questionText: "What is the main benefit of using AWS CloudFormation?",
    options: [
      'A. Automated infrastructure provisioning',
      'B. Serverless computing',
      'C. Data analytics',
      'D. Real-time data processing',
    ],
    correctAnswer: 'A. Automated infrastructure provisioning',
  ),

  // Domain: Networking & Content Delivery
  Question(
    questionText:
        "What are features of Amazon CloudFront for content delivery?",
    options: [
      'A. Global content delivery network (CDN)',
      'B. Integration with third-party monitoring tools',
      'C. Scalability and elasticity',
      'D. Support for long-running applications',
    ],
    correctAnswer: 'A. Global content delivery network (CDN)',
  ),

  // Domain: AWS Security Tools
  Question(
    questionText:
        "Which AWS service enables customers to discover, classify, and protect sensitive data in AWS?",
    options: [
      'A. Amazon Macie',
      'B. AWS Artifact',
      'C. AWS Config',
      'D. Amazon GuardDuty',
    ],
    correctAnswer: 'A. Amazon Macie',
  ),

  // Domain: AWS Glue
  Question(
    questionText:
        "What are benefits of using AWS Glue for data integration and ETL (extract, transform, load) tasks?",
    options: [
      'A. Scalability and elasticity',
      'B. Real-time data processing',
      'C. Integration with third-party monitoring tools',
      'D. Support for long-running applications',
    ],
    correctAnswer: 'A. Scalability and elasticity',
  ),

  // Domain: Understanding AWS Cloud costs, economics, and billing practices
  Question(
    questionText:
        "What is a characteristic of variable costs in the AWS cloud?",
    options: [
      'A. They are directly tied to usage',
      'B. They remain constant regardless of usage',
      'C. They are predictable and fixed',
      'D. They involve upfront payments',
    ],
    correctAnswer: 'A. They are directly tied to usage',
  ),

  // Domain: AWS Services
  Question(
    questionText:
        "Which AWS service provides authentication, authorization, and user management for web and mobile apps?",
    options: [
      'A. Simple Token Service (STS)',
      'B. AWS Autoscaling',
      'C. Amazon Cognito',
      'D. AWS Outposts',
    ],
    correctAnswer: 'C. Amazon Cognito',
  ),

  // Domain: AWS Compliance and Governance
  Question(
    questionText:
        "What is a feature of AWS Audit Manager that helps organizations track changes in their AWS environments?",
    options: [
      'A. Real-time log analysis',
      'B. Change tracking',
      'C. Serverless application monitoring',
      'D. AI-driven anomaly detection',
    ],
    correctAnswer: 'B. Change tracking',
  ),

  // Domain: Understanding the benefits of global infrastructure
  Question(
    questionText:
        "What is a consequence of global infrastructure in the AWS cloud?",
    options: [
      'A. Fixed service availability',
      'B. Improved disaster recovery capabilities',
      'C. Higher upfront costs',
      'D. Decreased geographic coverage',
    ],
    correctAnswer: 'B. Improved disaster recovery capabilities',
  ),

  // Domain: AWS Analytics Services
  Question(
    questionText:
        "Which AWS service enables customers to process and analyze streaming data in real-time with Apache Flink and Apache Kafka?",
    options: [
      'A. Amazon EMR',
      'B. Amazon Athena',
      'C. Amazon Redshift',
      'D. Amazon MSK (Managed Streaming for Apache Kafka)',
    ],
    correctAnswer: 'D. Amazon MSK (Managed Streaming for Apache Kafka)',
  ),

  // Domain: AWS Compliance and Governance
  Question(
    questionText: "What is AWS Artifact?",
    options: [
      'A. A service for monitoring AWS resource utilization',
      'B. A portal for accessing AWS compliance reports',
      'C. An AI-powered compliance automation tool',
      'D. A cloud-based document management system',
    ],
    correctAnswer: 'B. A portal for accessing AWS compliance reports',
  ),

  // Domain: Machine Learning
  Question(
    questionText:
        "What are benefits of using Amazon Comprehend for natural language processing (NLP)?",
    options: [
      'A. Scalability and elasticity',
      'B. Integration with third-party monitoring tools',
      'C. Entity recognition',
      'D. Support for real-time data processing',
    ],
    correctAnswer: 'A. Scalability and elasticity',
  ),

  // Domain: AWS Security Best Practices
  Question(
    questionText:
        "What is the potential risk of over-provisioning permissions in an AWS environment?",
    options: [
      'A. Increased likelihood of unauthorized access',
      'B. Enhanced resource utilization',
      'C. Automated compliance with regulations',
      'D. Simplified access management',
    ],
    correctAnswer: 'A. Increased likelihood of unauthorized access',
  ),

  // Domain: Internet of Things (IoT)
  Question(
    questionText:
        "What are benefits of using AWS IoT Events for detecting and responding to IoT events?",
    options: [
      'A. Event detection and alerting',
      'B. Scalability and elasticity',
      'C. Real-time data processing',
      'D. All of the above',
    ],
    correctAnswer: 'D. All of the above',
  ),

  // Domain: AWS Analytics Services
  Question(
    questionText:
        "What AWS service provides a scalable data warehouse solution in the cloud?",
    options: [
      'A. Amazon DynamoDB',
      'B. Amazon RDS',
      'C. Amazon Redshift',
      'D. Amazon S3',
    ],
    correctAnswer: 'C. Amazon Redshift',
  ),

  // Domain: AWS Regions, AWS Availability Zones, AWS Edge Locations
  Question(
    questionText: "What is the purpose of AWS Edge Locations?",
    options: [
      'A. To cache content and reduce latency for end-users',
      'B. To host EC2 instances',
      'C. To manage IAM policies',
      'D. To store data in S3 buckets',
    ],
    correctAnswer: 'A. To cache content and reduce latency for end-users',
  ),

  // Domain: Storage
  Question(
    questionText:
        "What are benefits of using AWS Storage Gateway for hybrid cloud storage?",
    options: [
      'A. Real-time data processing',
      'B. Integration with third-party monitoring tools',
      'C. Support for long running applications',
      'D. Seamless integration with on-premises environments',
    ],
    correctAnswer: 'D. Seamless integration with on-premises environments',
  ),

  // Domain: AWS Resource for Cloud Migration
  Question(
    questionText: "What is the role of AWS DataSync in cloud migration?",
    options: [
      'A. Managing cloud resources',
      'B. Real-time data analytics',
      'C. Transferring data between on-premises storage and AWS',
      'D. Building serverless applications',
    ],
    correctAnswer: 'C. Transferring data between on-premises storage and AWS',
  ),

  // Domain: AWS Compliance and Governance
  Question(
    questionText:
        "Which AWS service provides a managed compliance framework to help organizations assess and manage their compliance with industry standards and regulations?",
    options: [
      'A. AWS Config',
      'B. AWS Security Hub',
      'C. AWS Audit Manager',
      'D. Amazon Inspector',
    ],
    correctAnswer: 'C. AWS Audit Manager',
  ),

  // Domain: Machine Learning
  Question(
    questionText:
        "What are benefits of using Amazon Rekognition for image and video analysis?",
    options: [
      'A. Support for real-time data processing',
      'B. Integration with third-party monitoring tools',
      'C. Scalability and elasticity',
      'D. Object and scene detection',
    ],
    correctAnswer: 'C. Scalability and elasticity',
  ),

  // Domain: AWS Well-Architected Framework
  Question(
    questionText:
        "What is the objective of the Reliability pillar in the AWS Well-Architected Framework?",
    options: [
      'A. To secure data and systems',
      'B. To improve system performance',
      'C. To ensure systems can recover from failures and meet demand',
      'D. To optimize costs',
    ],
    correctAnswer:
        'C. To ensure systems can recover from failures and meet demand',
  ),

  // Domain: AWS Compute Services
  Question(
    questionText:
        "Which AWS service allows users to run code without provisioning or managing servers, paying only for the compute time consumed?",
    options: [
      'A. Amazon SQS (Simple Queue Service)',
      'B. Amazon EC2 (Elastic Compute Cloud)',
      'C. Amazon RDS (Relational Database Service)',
      'D. AWS Lambda',
    ],
    correctAnswer: 'D. AWS Lambda',
  ),

  // Domain: AWS Support
  Question(
    questionText: "What is a key feature of AWS Support Enterprise?",
    options: [
      'A. Access to AWS Trusted Advisor',
      'B. Free AWS credits',
      'C. 24/7 access to technical account managers',
      'D. Discounts on AWS training',
    ],
    correctAnswer: 'C. 24/7 access to technical account managers',
  ),

  // Domain: Database Services
  Question(
    questionText:
        "What are features of Amazon RDS (Relational Database Service)?",
    options: [
      'A. Automated backups and software patching',
      'B. Integration with Amazon DynamoDB',
      'C. Scalability and high availability',
      'D. Real-time data processing',
    ],
    correctAnswer: 'A. Automated backups and software patching',
  ),
];
