class Gosam < Formula
  desc "Automated calculation of one-loop amplitudes"
  homepage "http://gosam.hepforge.org"
  url "https://gosam.hepforge.org/gosam-2.0-latest.tar.gz"
  sha256 "530a01aa114f17f598b49767499d54a1bbcbe61e5b9ea721017d849bfde5836b"

  depends_on "automake"
  depends_on "qgraf"
  depends_on "form"
  depends_on "gosam-contrib"
  depends_on :python
  depends_on :java => "1.5+"

  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
    system "python", "setup.py", "install", "--prefix=#{prefix}"
    bin.install Dir[libexec/"bin/*"] unless Dir[libexec/"bin/*"].empty?
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end

  test do
    system "gosam-config.py"
  end
end
