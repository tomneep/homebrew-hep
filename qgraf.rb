class Qgraf < Formula
  homepage "http://cfif.ist.utl.pt/~paulo/qgraf.html"
  url "http://qgraf.ist.utl.pt/v3.1/qgraf-3.1.4.tgz", :user => "anonymous:"
  sha256 "b6f827a654124b368ea17cd391a78a49cda70e192e1c1c22e8e83142b07809dd"

  depends_on :fortran

  def install
    system ENV["FC"], "-o", "qgraf", "qgraf-3.1.4.f"
    bin.install_symlink "#{prefix}/qgraf"
    cp_r ".", prefix
  end

  test do
    system "qgraf"
  end
end
