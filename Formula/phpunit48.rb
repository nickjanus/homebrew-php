require File.expand_path("../../Requirements/php-meta-requirement", __FILE__)
require File.expand_path("../../Requirements/phar-requirement", __FILE__)

class Phpunit48 < Formula
  desc "PHPUnit is a testing framework for PHP."
  homepage "http://phpunit.de"
  url "https://phar.phpunit.de/phpunit-4.8.19.phar"
  sha256 "ff0e3c284f0170c2f8a6759937d7e0f1689c079e6aff114218a339bab79de8a9"

  conflicts_with "phpunit", :because => "both install a phpunit binary"

  bottle do
  end

  def install
    libexec.install "phpunit-#{version}.phar"
    sh = libexec + "phpunit"
    sh.write("#!/usr/bin/env bash\n\n/usr/bin/env php -d allow_url_fopen=On -d detect_unicode=Off #{libexec}/phpunit-#{version}.phar $*")
    chmod 0755, sh
    bin.install_symlink sh
  end

  test do
    shell_output("phpunit --version").include?(version)
  end
end
