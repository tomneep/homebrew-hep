class Herwig < Formula
  desc ""
  homepage "https://herwig.hepforge.org"
  url "http://www.hepforge.org/archive/herwig/Herwig-7.0.1.tar.bz2"
  version "7.0.1"
  sha256 "aa5caea8804b48f0adedea9c3b3f2adcfc1ab639b3f73a725ffddee13427ca92"

  depends_on "thepeg"
  depends_on "fastjet"
  depends_on "gsl"
  depends_on "boost"

  depends_on "madgraph5_amcatnlo" => :recommended
  depends_on "vbfnlo" => :optional
  depends_on "njet" => :optional
  depends_on "gosam" => :optional
  depends_on "openloops" => :optional
  
  def install
    args = %W[
      --disable-debug
      --disable-dependency-tracking
      --disable-silent-rules
      --prefix=#{prefix}
      --with-thepeg=#{Formula["thepeg"].opt_prefix}
      --with-fastjet=#{Formula["fastjet"].opt_prefix}
      --with-gsl=#{Formula["gsl"].opt_prefix}
      --with-boost=#{Formula["boost"].opt_prefix}
    ]

    args << "--with-madgraph=#{Formula["madgraph5_amcatnlo"].opt_prefix}" if build.with? "madgraph5_amcatnlo"
    args << "--with-vbfnlo=#{Formula["vbfnlo"].opt_prefix}" if build.with? "vbfnlo"
    args << "--with-njet=#{Formula["njet"].opt_prefix}" if build.with? "njet"
    args << "--with-gosam=#{Formula["gosam"].opt_prefix}" if build.with? "gosam"
    args << "--with-gosam-contrib=#{Formula["gosam-contrib"].opt_prefix}" if build.with? "gosam"
    args << "--with-openloops=#{Formula["openloops"].opt_prefix}" if build.with? "openloops"
    
    system "./configure", *args
    system "make", "check"
    system "make", "install"
  end

  test do
    system "Herwig read #{share}/Herwig/LHC-Matchbox.in"
    system "Herwig run LHC-Matchbox.run -N 50"    
  end
end
