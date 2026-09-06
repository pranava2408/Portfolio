"use client";
import { useState, useEffect } from "react";
import { motion } from "framer-motion";
import Link from "next/link";

export default function Navbar() {
  const [scrolled, setScrolled] = useState(false);

  useEffect(() => {
    const handleScroll = () => {
      setScrolled(window.scrollY > 50);
    };
    window.addEventListener("scroll", handleScroll);
    return () => window.removeEventListener("scroll", handleScroll);
  }, []);

  return (
    <motion.nav
      initial={{ y: -100 }}
      animate={{ y: 0 }}
      className={`fixed top-4 left-1/2 -translate-x-1/2 w-[95%] max-w-7xl z-50 transition-all duration-500 rounded-2xl border ${
        scrolled
          ? "bg-black/60 backdrop-blur-xl border-white/10 shadow-2xl py-4"
          : "bg-transparent border-transparent py-4"
      }`}
    >
      <div className="w-full px-6 flex justify-between items-center">
        <Link href="/">
          <span className="text-xl font-bold tracking-tight text-white cursor-pointer hover:text-accent transition-colors flex items-center gap-2">
            <span className="bg-white text-black px-2 py-1 rounded-md text-sm">PC</span>
            <span className="hidden sm:block font-mono tracking-tighter">Pranava.</span>
          </span>
        </Link>
        <div className="hidden md:flex gap-8 text-sm font-medium tracking-wide uppercase">
          {["About", "Projects", "Achievements", "Contact"].map((item) => (
            <Link key={item} href={`#${item.toLowerCase()}`}>
              <span className="text-gray-400 hover:text-white transition-colors cursor-pointer text-xs">
                {item}
              </span>
            </Link>
          ))}
        </div>
      </div>
    </motion.nav>
  );
}
