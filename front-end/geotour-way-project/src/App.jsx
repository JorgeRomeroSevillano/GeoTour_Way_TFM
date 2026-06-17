import { BrowserRouter, Route, Routes } from 'react-router-dom'
import Footer from './components/footer/Footer.jsx'
import Home from './pages/Home.jsx'
import Landing from './pages/Landing.jsx'
import NotFound from './pages/NotFound.jsx'
import './App.css'

function Layout({ children }) {
  return (
    <div className="app">
      <main className="app__main">{children}</main>
      <Footer />
    </div>
  )
}

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Layout><Landing /></Layout>} />
        <Route path="/home" element={<Layout><Home /></Layout>} />
        <Route path="*" element={<Layout><NotFound /></Layout>} />
      </Routes>
    </BrowserRouter>
  )
}

export default App
