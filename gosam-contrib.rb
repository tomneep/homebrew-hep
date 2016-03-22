class GosamContrib < Formula
  desc "Collection of GoSam dependencies"
  homepage "http://gosam.hepforge.org"
  url "https://gosam.hepforge.org/gosam-contrib-2.0-latest.tar.gz"
  version "2.0"
  sha256 "d8fcbfe4270ce250f37366e39b5cd19528bd520658930b3d204df29b905314da"

  depends_on :fortran

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
