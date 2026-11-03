import Hero from "@/components/Hero";
import Navbar from "@/components/Navbar";
import About from "@/components/About";
import Projects from "@/components/Projects";
import Achievements from "@/components/Achievements";
import Contact from "@/components/Contact";
import Footer from "@/components/Footer";
import Preloader from "@/components/Preloader";

export default function Home() {
  return (
    <>
      <Preloader />
      <main className="min-h-screen bg-background text-foreground transition-colors duration-500">
        <Navbar />
        <Hero />
        <About />
        <Projects />
        <Achievements />
        <Contact />
        <Footer />
      </main>
    </>
  );
}
