class AwsLambdaBuilders < Formula
  include Language::Python::Virtualenv

  desc "AWS Lambda Builders"
  
  homepage "https://github.com/awslabs/aws-lambda-builders/"
  head "https://github.com/awslabs/aws-lambda-builders.git", :branch => "develop"
  bottle :unneeded

  depends_on "python"

  def install
    venv = virtualenv_create(libexec, "python3")
    system libexec/"bin/pip", "install", "-v", "--no-binary", ":all:",
                              "--ignore-installed", buildpath
    system libexec/"bin/pip", "uninstall", "-y", "aws-lambda-builders"
    venv.pip_install_and_link buildpath
  end

  test do
    assert_match "Usage", shell_output("#{bin}/lambda-builders <request>")
  end
end
