class Jtbl < Formula
  include Language::Python::Virtualenv

  desc "Convert JSON and JSON Lines to terminal, CSV, HTTP, and markdown tables"
  homepage "https://github.com/kellyjonbrazil/jtbl"
  url "https://files.pythonhosted.org/packages/9e/7c/b21f3383ca611b56dbc281081cca73a24274c3f39654e7fe196d73a67af6/jtbl-1.6.0.tar.gz"
  sha256 "7de0cb08ebb2b3a0658229a8edd4204c6944cbd9e3e04724a9ea235a61c115a5"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sequoia:  "f256bbd4fe42e094b76de00f726e28589a0d8257bc341a91d5945794f2e22c00"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "21a81be0445de58f0e890b2b6b45fe9acefc6e4aaf2843874cbcfc143f6e82e6"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "21a81be0445de58f0e890b2b6b45fe9acefc6e4aaf2843874cbcfc143f6e82e6"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "21a81be0445de58f0e890b2b6b45fe9acefc6e4aaf2843874cbcfc143f6e82e6"
    sha256 cellar: :any_skip_relocation, sonoma:         "e0848f48a0387422d6ca1c9fc68e9b5a741f7d0072bf69e2fa96c4dc040bcbb8"
    sha256 cellar: :any_skip_relocation, ventura:        "e0848f48a0387422d6ca1c9fc68e9b5a741f7d0072bf69e2fa96c4dc040bcbb8"
    sha256 cellar: :any_skip_relocation, monterey:       "e0848f48a0387422d6ca1c9fc68e9b5a741f7d0072bf69e2fa96c4dc040bcbb8"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "5812058f8e11da8ef073f6aafbcff218424383be387f5ba14ab542198e57014b"
  end

  depends_on "python@3.13"

  resource "tabulate" do
    url "https://files.pythonhosted.org/packages/ec/fe/802052aecb21e3797b8f7902564ab6ea0d60ff8ca23952079064155d1ae1/tabulate-0.9.0.tar.gz"
    sha256 "0095b12bf5966de529c0feb1fa08671671b3368eec77d7ef7ab114be2c068b3c"
  end

  def install
    virtualenv_install_with_resources
    man1.install "man/jtbl.1"
  end

  test do
    assert_match <<~EOS, pipe_output(bin/"jtbl", "[{\"a\":1,\"b\":1},{\"a\":2,\"b\":2}]")
        a    b
      ---  ---
        1    1
        2    2
    EOS

    assert_match version.to_s, shell_output("#{bin}/jtbl --version 2>&1", 1)
  end
end
