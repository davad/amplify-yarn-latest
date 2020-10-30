# Custom build image for Amplify Console for using latest version of Yarn.

## Background
I pulled this together because I couldn't get Yarn 2 working with the standard Amplify Console image.

Based on https://github.com/butaca/amplify-hugo

## Usage

From your App details page, navigate to App settings -> Build settings. Specify the custom image as `davad/amplify-yarn-latest`

## References

* https://docs.aws.amazon.com/amplify/latest/userguide/custom-build-image.html
* https://github.com/butaca/amplify-hugo
