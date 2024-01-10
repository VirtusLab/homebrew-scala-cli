# typed: false
# frozen_string_literal: true

# ScalaCli Formula
class ScalaCli < Formula
  desc "Launcher for ScalaCli"
  homepage "https://virtuslab.github.io/scala-cli/"
  url (RUBY_PLATFORM.include? "arm64") ?
    "https://github.com/Virtuslab/scala-cli/releases/download/v1.1.1/scala-cli-aarch64-apple-darwin.gz" :
    "https://github.com/Virtuslab/scala-cli/releases/download/v1.1.1/scala-cli-x86_64-apple-darwin.gz"
  version "1.1.1"
  sha256 (RUBY_PLATFORM.include? "arm64") ?
    "426eb552595140280fedccda66a54a186be25504a1c509e483bdc38f5fe3aeeb" :
    "9075f89a1f3e20040bd1c25ce318aed8281e88bda800893c9dc583dc14b3b117"
  license "Apache-2.0"

  def install
    if (RUBY_PLATFORM.include? "arm64")
      bin.install "scala-cli-aarch64-apple-darwin" => "scala-cli"
    else
      bin.install "scala-cli-x86_64-apple-darwin" => "scala-cli"
    end
  end

  test do
    (testpath / "Hello.scala").write "object Hello {
                                def main(args: Array[String]): Unit =
                                  println(\"Hello from Scala\")
                              }"
    output = shell_output("#{bin}/scala-cli Hello.scala")
    assert_equal ["Hello from Scala\n"], output.lines
  end
end
