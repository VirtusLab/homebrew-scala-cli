# typed: false
# frozen_string_literal: true

# ScalaCli Formula
class ScalaCli < Formula
  desc "Launcher for ScalaCli"
  homepage "https://virtuslab.github.io/scala-cli/"
  url "https://github.com/Virtuslab/scala-cli/releases/download/v0.1.12/scala-cli-x86_64-apple-darwin.gz"
  version "0.1.12"
  sha256 "dbf0a5e5935c9afa4606b60b0302be5360f4b374882db96a36b505688ee1e5bd"
  license "Apache-2.0"

  def install
    bin.install "scala-cli-x86_64-apple-darwin" => "scala-cli"
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
