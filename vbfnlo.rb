class Vbfnlo < Formula
  desc "VBFNLO: A parton level Monte Carlo for processes with electroweak bosons"
  homepage "https://www.itp.kit.edu/~vbfnloweb/wiki/doku.php?id=Overview"
  url "https://www.itp.kit.edu/~vbfnloweb/wiki/lib/exe/fetch.php?media=download:vbfnlo-3.0.0beta2.tgz"
  version "3.0.0.2"
  sha256 "c4b998f7541f0b192da69ee47597f7fcdee7e537326a2542e8122cf4eed4749c"

  depends_on :fortran

  def install
    ENV.delete("F77")

    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"

    system "make"
    system "make", "install"
  end

  test do
    ohai "Generating p p --> H jj"
    system "vbfnlo"
    ohai "Done!"
  end
end
