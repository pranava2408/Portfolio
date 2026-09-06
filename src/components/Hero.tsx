"use client";
import { motion } from "framer-motion";
import { Mail } from "lucide-react";
import Link from "next/link";

const GithubIcon = ({ size = 24 }) => (
  <svg xmlns="http://www.w3.org/2000/svg" width={size} height={size} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
    <path d="M15 22v-4a4.8 4.8 0 0 0-1-3.02c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77 5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A4.8 4.8 0 0 0 8 18v4"></path>
  </svg>
);

const LinkedinIcon = ({ size = 24 }) => (
  <svg xmlns="http://www.w3.org/2000/svg" width={size} height={size} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
    <path d="M16 8a6 6 0 0 1 6 6v7h-4v-7a2 2 0 0 0-2-2 2 2 0 0 0-2 2v7h-4v-7a6 6 0 0 1 6-6z"></path>
    <rect x="2" y="9" width="4" height="12"></rect>
    <circle cx="4" cy="4" r="2"></circle>
  </svg>
);

export default function Hero() {
  return (
    <section id="hero" className="min-h-screen flex items-center justify-center pt-20 px-6 md:px-12 relative overflow-hidden">
      {/* Background glow */}
      <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[600px] h-[600px] bg-accent/10 rounded-full blur-[120px] -z-10 pointer-events-none" />
      
      <div className="max-w-7xl mx-auto w-full text-center md:text-left flex flex-col items-center md:items-start">
        <motion.p
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.5 }}
          className="text-accent font-medium mb-4 tracking-wide"
        >
          Hi, my name is
        </motion.p>
        <motion.h1
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.5, delay: 0.1 }}
          className="text-5xl md:text-7xl font-bold text-white mb-4 tracking-tight"
        >
          Balla Pranava Chaitanya.
        </motion.h1>
        <motion.h2
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.5, delay: 0.2 }}
          className="text-4xl md:text-6xl font-bold text-gray-400 mb-6 tracking-tight"
        >
          I build intelligent systems.
        </motion.h2>
        <motion.p
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.5, delay: 0.3 }}
          className="text-lg text-gray-400 max-w-2xl mb-10 leading-relaxed mx-auto md:mx-0"
        >
          I'm a Computer Science engineering student at NIT Silchar. I specialize in building
          exceptional digital experiences, leveraging AI, and competing at top-tier competitive
          programming platforms.
        </motion.p>
        
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.5, delay: 0.4 }}
          className="flex items-center gap-6"
        >
          <a href="#projects" className="px-8 py-4 bg-accent text-gray-900 rounded-lg font-semibold hover:bg-accent/90 transition-colors shadow-lg shadow-accent/20">
            Check out my work!
          </a>
          <div className="flex gap-4">
            <Link href="https://github.com/pranava2408" target="_blank" className="p-3 bg-gray-800/50 rounded-full hover:bg-gray-700/50 hover:text-accent transition-all">
              <GithubIcon size={24} />
            </Link>
            <Link href="https://linkedin.com/in/balla-pranava-chaitanya-59b84628a" target="_blank" className="p-3 bg-gray-800/50 rounded-full hover:bg-gray-700/50 hover:text-accent transition-all">
              <LinkedinIcon size={24} />
            </Link>
            <Link href="mailto:pranavachaitanyaballa@gmail.com" className="p-3 bg-gray-800/50 rounded-full hover:bg-gray-700/50 hover:text-accent transition-all">
              <Mail size={24} />
            </Link>
          </div>
        </motion.div>
      </div>
    </section>
  );
}
