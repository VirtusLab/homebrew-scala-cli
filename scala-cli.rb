class ScalaCli < Formula
  desc "Launcher for ScalaCli"
  homepage "https://virtuslabrnd.github.io/scala-cli/"
  url "https://github.com/VirtuslabRnD/scala-cli/releases/download/latest/scala-cli-x86_64-apple-darwin.gz"
  version "latest"
  bottle :unneeded

  depends_on java: "1.8+" if MacOS.version < :catalina
  depends_on "openjdk" if MacOS.version >= :catalina

  def install
    bin.install "scala-cli-x86_64-apple-darwin" => "scala-cli"
  end

  test do
    (testpath/"Hello.scala").write "object Hello {
                                def main(args: Array[String]): Unit =
                                  println(\"Hello from Scala\")
                              }"
    output = shell_output("#{bin}/scala-cli Hello.scala")
    assert_equal ["Hello from Scala\n"], output.lines

  end
end