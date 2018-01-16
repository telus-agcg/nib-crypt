# nib-crypt

Add basic file encryption/decryption support to `nib`. This project deviates from the original intention of `nib` in that it does not specifically relate to `docker-compose` at all. In that way the API will be slightly different because a "service" is not involved, just file en/decryption.

## Installation

Install the gem on your machine globally:

```sh
gem install nib-crypt
```

### Dependencies

* `OpenSSL` is used to perform the file encryption/decryption (present on most systems already)
* [`AWS Command Line Interface`](https://aws.amazon.com/cli/) is used to fetch and persist keys on in a bucket on S3 (install via [whalebrew](https://github.com/bfirsh/whalebrew) recommended)

### Configuration

`nib-crypt` will use a shared key for the purposes of encryption and decryption. These keys are to be stored in a (hopefully!) secure bucket on AWS S3. That means `nib-crypt` must be configured with the name of the bucket you would like to store secret files in.

```sh
# .bashrc or .zshenv etc
export NIB_CRYPT_BUCKENT_NAME=secrets-r-us
```

## Usage

`nib-crypt` expects a file name `secrets.aes` to be present in the current directory (typically the root of a project). If this file does not exists the `crypt-init` command can be used to create one or pull an existing one from AWS S3 if one exists for the project.

### Initialize a project

This command will check to see if a key exists for the current project (stored as `projectname.secrets.aes` on AWS S3). If a key exists it will be copied down from AWS S3. If a key does not yet exist a new one will be created and pushed to the configured bucket on AWS S3.

```sh
nib crypt-init
```

### Encrypt a file

Use the existing key file to encrypt a file

```sh
nib encrypt [input] [output]
```

### Decrypt a file

```sh
nib decrypt [input] [output]
```

## Development

After pull down the repo build an image and use Guard to facilitate running specs and RuboCop.

```sh
nib build
nib guard gem
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/johnallen3d/nib-crypt.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
