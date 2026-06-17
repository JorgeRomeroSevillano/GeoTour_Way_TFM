import { BadgeInfo, Compass, Globe2, Image, Mail } from 'lucide-react'
import './styles/Footer.css'

function Footer() {
  return (
    <footer className="site-footer" aria-label="Pie de página">
      <div className="site-footer__icon-group" aria-hidden="true">
        <Mail size={26} strokeWidth={2.7} />
        <BadgeInfo size={25} strokeWidth={2.7} />
      </div>

      <p className="site-footer__brand">GeoTour Way</p>

      <div
        className="site-footer__icon-group site-footer__icon-group--right"
        aria-hidden="true"
      >
        <Globe2 size={25} strokeWidth={2.7} />
        <Compass size={25} strokeWidth={2.7} />
        <Image size={25} strokeWidth={2.7} />
      </div>
    </footer>
  )
}

export default Footer
