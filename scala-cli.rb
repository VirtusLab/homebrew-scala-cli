# typed: false
# frozen_string_literal: true

# ScalaCli Formula
class ScalaCli < Formula
  desc "Launcher for ScalaCli"
  homepage "https://virtuslab.github.io/scala-cli/"
  url (RUBY_PLATFORM.include? "arm64") ?
    "https://github.com/Virtuslab/scala-cli/releases/download/v1.5.3/scala-cli-aarch64-apple-darwin.gz" :
    "https://github.com/Virtuslab/scala-cli/releases/download/v1.5.3/scala-cli-x86_64-apple-darwin.gz"
  version "1.5.3"
  sha256 (RUBY_PLATFORM.include? "arm64") ?
    "4c985416ea61251b75b5c77dd0684fc9af1365ccc8f4e16f9cb1e9a6eddbffae" :
    "f1c7d2fd0e4bd4432d8c73c4260a7cf42dcf23e960ac7c12b74a1821e08569ac"
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
