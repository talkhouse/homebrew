require 'formula'

class Putty < Formula
  homepage 'http://www.chiark.greenend.org.uk/~sgtatham/putty/'
  url 'http://the.earth.li/~sgtatham/putty/0.62/putty-0.62.tar.gz'
  sha1 '5898438614117ee7e3704fc3f30a3c4bf2041380'

  def install
    # use the unix build to make all PuTTY command line tools
    cd "unix" do
      # disable GTK upon configure
      system "./configure", "--prefix=#{prefix}",
                            "--disable-gtktest",
                            "--with-gtk-prefix=/dev/null"
      system "make", "VER=-DRELEASE=#{version}", "all-cli"
      # install manually
      bin.install %w{ plink pscp psftp puttygen }
    end
    cd "doc" do
      man1.install %w{ plink.1 pscp.1 psftp.1 puttygen.1 }
    end
  end
end
