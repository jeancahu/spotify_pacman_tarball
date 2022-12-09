# Maintainer: Jeancarlo Hidalgo <jeancahu@gmail.com>

pkgname=spotify
pkgver=1.0
pkgrel=1
epoch=1
pkgdesc="Spotify: A spotify package from original repository"
arch=('x86_64')
license=('custom')
url='https://www.github.com/jeancahu/spotify_archlinux'
depends=('alsa-lib>=1.0.14' 'gtk2' 'libsystemd' 'libxss' 'desktop-file-utils' 'openssl' 'nss' 'at-spi2-atk')
depends_x86_64=('libcurl-gnutls')

options=('!strip')

source=(LICENSE::"https://aur.archlinux.org/cgit/aur.git/plain/LICENSE?h=spotify")

source_x86_64=('data.deb')

sha512sums=('SKIP')

sha512sums_x86_64=('SKIP')

prepare () {
    mkdir "${srcdir}/data"
    tar -xzf data.tar.gz -C "${srcdir}/data"
    tar -xzf control.tar.gz -C "${srcdir}/data"
}

package () {

    install -Dm644 "${srcdir}/data/usr/share/spotify/spotify.desktop" \
	    "${pkgdir}/usr/share/applications/spotify.desktop"
    install -Dm644 "${srcdir}/data/usr/share/spotify/icons/spotify-linux-512.png" \
	    "${pkgdir}/usr/share/pixmaps/spotify-client.png"

    for size in 22 24 32 48 64 128 256 512; do
        install -Dm644 "${srcdir}/data/usr/share/spotify/icons/spotify-linux-$size.png" \
            "${srcdir}/data/usr/share/icons/hicolor/${size}x${size}/apps/spotify.png"
    done

    # Install spotify libs
    for spotify_lib in "${srcdir}/data/usr/share/spotify/"*.so*
    do
	install -Dm644 "${spotify_lib}" "${pkgdir}/usr/share/spotify/$( basename "${spotify_lib}")"
    done

    ## Install spotify executable
    install -Dm644 "${srcdir}/data/usr/share/spotify/spotify" "${pkgdir}/usr/share/spotify/spotify"

    # Symlink spotify binary
    ln -s "${pkgdir}/usr/share/spotify/spotify" "${pkgdir}/usr/bin/spotify"

    # Install license
    # https://www.spotify.com/legal/end-user-agreement
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

