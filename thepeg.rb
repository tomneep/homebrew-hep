class Thepeg < Formula
  homepage "http://herwig.hepforge.org/"
  url "http://www.hepforge.org/archive/thepeg/ThePEG-2.0.1.tar.bz2"
  sha256 "ec284abdc82ceaf10a8736f908e7955f49f872b79aaa62d22aa33bc5c7679bdb"

  head do
    url "http://thepeg.hepforge.org/hg/ThePEG", :using => :hg

    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
  end

  option "with-check", "Test during installation"
  depends_on "gsl"
  depends_on "hepmc"   => :recommended
  depends_on "rivet"   => :recommended
  depends_on "lhapdf"  => :recommended
  depends_on "fastjet" => :recommended

  def install
    args = %W[
      --disable-dependency-tracking
      --prefix=#{prefix}
      --with-gsl=#{Formula["gsl"].opt_prefix}
    ]

    args << "--with-fastjet=#{Formula["fastjet"].opt_prefix}" if build.with? "fastjet"
    args << "--with-rivet=#{Formula["rivet"].opt_prefix}" if build.with? "rivet"
    args << "--with-hepmc=#{Formula["hepmc"].opt_prefix}" if build.with? "hepmc"
    args << "--with-lhapdf=#{Formula["lhapdf"].opt_prefix}" if build.with? "lhapdf"

    system "autoreconf", "-i" if build.head?
    system "./configure", *args
    system "make"
    system "make", "check" if build.with? "check"
    system "make", "install"
  end

  test do
    system "setupThePEG", "#{share}/ThePEG/MultiLEP.in"
    system "runThePEG", "MultiLEP.run"
  end
end
