# Terraform Importer

A simple shell script that imports aws resources into terraform format using [Terraformer](https://github.com/GoogleCloudPlatform/terraformer) tool.

## Usage

```bash
☁  terraform-importer ./main.sh

Enter with the aws resource(s)(eg. rds,ebs,ec2_instance): ec2_instance
Enter with the Resource name or id: i-0ahg3b28ed854998099
Enter with the aws profile name: default
2022/01/26 21:05:37 aws importing region us-east-1
2022/01/26 21:05:42 aws importing... ec2_instance
2022/01/26 21:05:47 aws done importing ec2_instance
2022/01/26 21:05:47 Number of resources for service ec2_instance: 1
2022/01/26 21:05:47 aws Connecting....
2022/01/26 21:05:47 aws save ec2_instance
2022/01/26 21:05:47 aws save tfstate for ec2_instance
```

## The clean script

For clean the generate files and directories use the clean.sh script.

```bash
☁  terraform-importer ./clean.sh
```

## Eligible Services

We recommend that you access the terraformer [documentation](https://github.com/GoogleCloudPlatform/terraformer/blob/master/docs/aws.md).

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[GNU](https://www.gnu.org/licenses/gpl-3.0.en.html)