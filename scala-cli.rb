# typed: false
# frozen_string_literal: true

# ScalaCli Formula
class ScalaCli < Formula
  desc "Launcher for ScalaCli"
  homepage "https://virtuslab.github.io/scala-cli/"
  url "https://github.com/Virtuslab/scala-cli/releases/download/v0.1.2/scala-cli-x86_64-apple-darwin.gz"
  version "0.1.2"
  sha256 "38b9d577eabc3f8b274f801a69e9b2cc8c0fc2bcbc3d56779a20fc299c1a8580"
  license "Apache-2.0"

  depends_on java: "1.8+" if MacOS.version < :catalina
  depends_on "openjdk" if MacOS.version >= :catalina

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
