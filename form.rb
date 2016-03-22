class Form < Formula
  desc "Symbolic Manipulation System"
  homepage "http://www.nikhef.nl/~form/"
  url "https://github.com/vermaseren/form/releases/download/v4.1-20131025/form-4.1.tar.gz"
  sha256 "fb3470937d66ed5cb1af896b15058836d2c805d767adac1b9073ed2df731cbe9"

  depends_on "gmp"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "--with-gmp=#{Formula["gmp"].opt_prefix}"
    system "make"
    system "make", "install"
  end

  test do
    open("sample1.frm", "w") do |f|
      f << "Symbols a,b;\n"
      f << "Local [(a+b)^2] = (a+b)^2;\n"
      f << "Print;\n"
      f << ".end\n"
    end
    system "form", "sample1.frm"
  end
end
