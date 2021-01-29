# Maintainer: Jeancarlo Hidalgo <jeancahu@gmail.com>

pkgname=spotify
pkgver=2.0
pkgrel=1
epoch=1
pkgdesc="Spotify: A spotify package version by Jean"
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
    echo "Soy el método 'prepare'"	
}

package () {
    cd "${srcdir}"
	
    echo tar -xzf data.tar.gz -C "${pkgdir}"
    tar -xzf data.tar.gz -C "${pkgdir}"

    install -Dm644 "${pkgdir}"/usr/share/spotify/spotify.desktop "${pkgdir}"/usr/share/applications/spotify.desktop
    install -Dm644 "${pkgdir}"/usr/share/spotify/icons/spotify-linux-512.png "${pkgdir}"/usr/share/pixmaps/spotify-client.png

    for size in 22 24 32 48 64 128 256 512; do
        install -Dm644 "${pkgdir}/usr/share/spotify/icons/spotify-linux-$size.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/spotify.png"
    done

    # Move spotify binary to its proper location
    mkdir -p "${pkgdir}"/opt/spotify
    mv "${pkgdir}/usr/share/spotify" "${pkgdir}/opt/"

    # Symlink spotify binary which is located in /opt
    ln -sf /opt/spotify/spotify "${pkgdir}/usr/bin/spotify"

    # Install license
    # https://www.spotify.com/legal/end-user-agreement
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Fix permissions
    chmod -R go-w "${pkgdir}"
}

