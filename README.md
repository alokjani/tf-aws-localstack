
Example showing how to use Terraform and Localstack Community Edition for local development using Amazon API.

Install and Startup localstack:

```
python3 -m pip install localstack
python3 -m localstack.cli.main  start

     __                     _______ __             __
    / /   ____  _________ _/ / ___// /_____ ______/ /__
   / /   / __ \/ ___/ __ `/ /\__ \/ __/ __ `/ ___/ //_/
  / /___/ /_/ / /__/ /_/ / /___/ / /_/ /_/ / /__/ ,<
 /_____/\____/\___/\__,_/_//____/\__/\__,_/\___/_/|_|

 💻 LocalStack CLI 0.13.0.9

[15:22:14] starting LocalStack in Docker mode 🐳 
...

LocalStack version: 0.13.0.8
LocalStack Docker container id: f3b92b4e5a61
LocalStack build date: 2021-11-29
LocalStack build git hash: 74230c00

Starting edge router (https port 4566)...
Ready.
[2021-11-30 09:52:20 +0000] [22] [INFO] Running on https://0.0.0.0:4566 (CTRL + C to quit)
2021-11-30T09:52:20.756:INFO:hypercorn.error: Running on https://0.0.0.0:4566 (CTRL + C to quit)
2021-11-30T09:52:20.855:INFO:bootstrap.py: Execution of "start_runtime_components" took 513.44ms
```

Verify AWS API Endpoints

```
curl -s localhost:4566/health | python -mjson.tool
{
    "features": {
        "initScripts": "initialized"
    },
    "services": {
        "acm": "available",
        "apigateway": "available",
        "cloudformation": "available",
        "cloudwatch": "available",
        "config": "available",
        "dynamodb": "available",
        "dynamodbstreams": "available",
        "ec2": "available",
        "es": "available",
        "events": "available",
        "firehose": "available",
        "iam": "available",
        "kinesis": "available",
        "kms": "available",
        "lambda": "available",
        "logs": "available",
        "redshift": "available",
        "resource-groups": "available",
        "resourcegroupstaggingapi": "available",
        "route53": "available",
        "s3": "running",
        "secretsmanager": "available",
        "ses": "available",
        "sns": "running",
        "sqs": "running",
        "ssm": "available",
        "stepfunctions": "available",
        "sts": "available",
        "support": "available",
        "swf": "available"
    }
}

```

Setup terraform:

```
brew install tfenv
tfenv install latest
tfenv use latest
```

Setup S3 buckets:

```
aws --endpoint-url=http://localhost:4566 s3 mb s3://sample-bucket
aws --endpoint-url=http://localhost:4566 s3 ls
aws --endpoint-url=http://localhost:4566 s3api create-bucket --bucket archive-bucket-old
```

Setup topics, queues, subscriptions:

```
aws --endpoint-url=http://localhost:4566 sqs create-queue --queue-name sample-queue2
aws --endpoint-url=http://localhost:4566 sqs create-queue --queue-name sample-queue-sns
aws --endpoint-url=http://localhost:4566 sns create-topic --name sample-topic
```