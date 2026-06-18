import { BrowserRouter, Route, Routes } from 'react-router-dom'
import Footer from './components/footer/Footer.jsx'
import Header from './components/header/Header.jsx'
import LanguageProvider from './provider/LanguageProvider.jsx'
import Favourites from './views/Favourites.jsx'
import Home from './views/Home.jsx'
import Landing from './views/Landing.jsx'
import NotFound from './views/NotFound.jsx'
import './App.css'

function Layout({ children, showHeader = false }) {
  return (
    <div className="app">
      {showHeader && <Header />}
      <main className="app__main">{children}</main>
      <Footer />
    </div>
  )
}

function App() {
  return (
    <LanguageProvider>
      <BrowserRouter>
        <Routes>
          <Route path="/" element={<Layout><Landing /></Layout>} />
          <Route path="/home" element={<Layout showHeader><Home /></Layout>} />
          <Route path="/favourites" element={<Layout showHeader><Favourites /></Layout>} />
          <Route path="*" element={<Layout><NotFound /></Layout>} />
        </Routes>
      </BrowserRouter>
    </LanguageProvider>
  )
}

export default App
