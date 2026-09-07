"use client";
import { useState, useEffect } from "react";
import { motion } from "framer-motion";
import Link from "next/link";
import { useTheme } from "next-themes";
import { Moon, Sun } from "lucide-react";

export default function Navbar() {
  const [scrolled, setScrolled] = useState(false);
  const { theme, setTheme } = useTheme();
  const [mounted, setMounted] = useState(false);

  useEffect(() => {
    setMounted(true);
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
          ? "bg-white/70 dark:bg-black/60 backdrop-blur-xl border-gray-200 dark:border-white/10 shadow-2xl py-3"
          : "bg-transparent border-transparent py-4"
      }`}
    >
      <div className="w-full px-6 flex justify-between items-center">
        <Link href="/">
          <span className="text-xl font-bold tracking-tight text-gray-900 dark:text-white cursor-pointer hover:text-blue-600 dark:hover:text-accent transition-colors flex items-center gap-2 group">
            <span className="bg-gray-900 text-white dark:bg-white dark:text-black px-2 py-1 rounded-md text-sm transition-colors">PC</span>
            <span className="hidden sm:block font-mono tracking-tighter">Pranava.</span>
          </span>
        </Link>
        
        <div className="flex items-center gap-2 md:gap-4">
          <div className="hidden md:flex gap-2 text-sm font-medium tracking-wide uppercase">
            {["About", "Projects", "Achievements", "Contact"].map((item) => (
              <Link key={item} href={`#${item.toLowerCase()}`}>
                <span className="px-4 py-2 rounded-full text-gray-600 hover:text-gray-900 hover:bg-gray-200/50 dark:text-gray-400 dark:hover:text-white dark:hover:bg-white/10 transition-all cursor-pointer text-xs">
                  {item}
                </span>
              </Link>
            ))}
          </div>
          
          {mounted && (
            <button
              onClick={() => setTheme(theme === "dark" ? "light" : "dark")}
              className="p-2 rounded-full bg-gray-200/50 text-gray-700 hover:bg-gray-300 dark:bg-white/10 dark:text-gray-300 dark:hover:bg-white/20 transition-all ml-2"
              aria-label="Toggle Theme"
            >
              {theme === "dark" ? <Sun size={16} /> : <Moon size={16} />}
            </button>
          )}
        </div>
      </div>
    </motion.nav>
  );
}
