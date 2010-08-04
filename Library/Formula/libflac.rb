require 'formula'

class Libflac <Formula
  url 'http://downloads.xiph.org/releases/flac/flac-1.2.1.tar.gz'
  md5 '153c8b15a54da428d1f0fadc756c22c7'
  homepage 'http://www.xiph.org/downloads/'

  depends_on 'pkg-config'
  depends_on 'libogg'

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-asm-optimizations",
          "--mandir=#{man}" 
    system "make install"
  end
end
