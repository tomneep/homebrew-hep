class Njet < Formula
  desc "Library for multi-parton one-loop matrix elements in massless QCD."
  homepage "https://bitbucket.org/njet/njet/wiki/Home"
  url "https://bitbucket.org/njet/njet/downloads/njet-2.0.0.tar.gz"
  sha256 "a1f5c171b8aff3553d9dde24d3ced5479bdaeec67f4c90c70a846ee3449b40ea"

  depends_on :fortran

  def install
    ENV.libstdcxx if ENV.compiler == :clang
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--disable-autoflags",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "njet.py", "--help"
  end
end
