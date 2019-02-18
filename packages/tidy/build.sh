TERMUX_PKG_HOMEPAGE=http://www.html-tidy.org/
TERMUX_PKG_DESCRIPTION="A tool to tidy down your HTML code to a clean style"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"
TERMUX_PKG_VERSION=5.7.16
_COMMIT=5f7e367cb54563dabda4bf4e3c11c6ecc68a0fa3
TERMUX_PKG_SRCURL=https://github.com/htacg/tidy-html5/archive/${_COMMIT}.tar.gz
TERMUX_PKG_SHA256=7ff3ef0a774f44e780df9b94e48c2ea070a6cfc791b5bd907359fd718a7f1004
TERMUX_PKG_DEPENDS="libxslt"
TERMUX_PKG_HOSTBUILD=true

termux_step_host_build() {
	## Host build required to generate man pages.
	termux_setup_cmake
	cmake "$TERMUX_PKG_SRCDIR" && make
}

termux_step_post_make_install() {
	install -Dm600 \
		"$TERMUX_PKG_HOSTBUILD_DIR"/tidy.1 \
		"$TERMUX_PREFIX"/share/man/man1/
}
