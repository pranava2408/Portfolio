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
      className={`fixed top-0 w-full z-50 transition-all duration-300 border-b ${
        scrolled
          ? "bg-[#0d1117]/80 backdrop-blur-md border-gray-800 py-4"
          : "bg-transparent border-transparent py-6"
      }`}
    >
      <div className="max-w-7xl mx-auto px-6 md:px-12 flex justify-between items-center">
        <Link href="/">
          <span className="text-xl font-bold tracking-tight text-white cursor-pointer hover:text-accent transition-colors">
            Pranava.
          </span>
        </Link>
        <div className="hidden md:flex gap-8 text-sm font-medium">
          {["About", "Projects", "Achievements", "Contact"].map((item) => (
            <Link key={item} href={`#${item.toLowerCase()}`}>
              <span className="text-gray-300 hover:text-accent transition-colors cursor-pointer">
                {item}
              </span>
            </Link>
          ))}
        </div>
      </div>
    </motion.nav>
  );
}
