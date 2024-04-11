# typed: false
# frozen_string_literal: true

# ScalaCli Formula
class ScalaCli < Formula
  desc "Launcher for ScalaCli"
  homepage "https://virtuslab.github.io/scala-cli/"
  url (RUBY_PLATFORM.include? "arm64") ?
    "https://github.com/Virtuslab/scala-cli/releases/download/v1.2.2/scala-cli-aarch64-apple-darwin.gz" :
    "https://github.com/Virtuslab/scala-cli/releases/download/v1.2.2/scala-cli-x86_64-apple-darwin.gz"
  version "1.2.2"
  sha256 (RUBY_PLATFORM.include? "arm64") ?
    "a10da569eeecb3852dfc94e7e77731b783a041bc05a74e695c93313a20977880" :
    "1124c906253be45c9cd8a517eb66c3c92ac545eea23a3fc2bb7c94594afb3126"
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
