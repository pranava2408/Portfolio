"use client";
import { motion } from "framer-motion";
import { Mail } from "lucide-react";

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
    <section id="hero" className="relative min-h-screen w-full flex items-center justify-center overflow-hidden rounded-b-[40px] z-10 border-b border-gray-200 dark:border-white/5">
      {/* Noise Filter */}
      <div 
        className="absolute inset-0 pointer-events-none opacity-[0.02] dark:opacity-[0.04] mix-blend-multiply dark:mix-blend-screen"
        style={{ backgroundImage: `url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='noise'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.8' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23noise)'/%3E%3C/svg%3E")` }}
      />
      
      {/* Background Gradients */}
      <div className="absolute top-0 right-0 w-[500px] h-[500px] rounded-full blur-[120px] opacity-20 dark:opacity-20 bg-gradient-radial from-blue-400 to-transparent pointer-events-none" />
      <div className="absolute -bottom-40 -left-40 w-[400px] h-[400px] rounded-full blur-[100px] opacity-15 dark:opacity-15 bg-gradient-radial from-indigo-400 to-transparent pointer-events-none" />

      <div className="relative z-10 w-full max-w-5xl mx-auto px-6 sm:px-10 mt-16 flex flex-col items-center text-center">
        <motion.p 
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6 }}
          className="text-xs sm:text-sm tracking-[0.35em] uppercase mb-4 text-gray-500 dark:text-gray-400 font-medium"
        >
          <span className="inline-flex items-center gap-4">
            <span className="w-8 h-[2px] bg-blue-500/50 rounded-full"></span>
            Welcome to my world
            <span className="w-8 h-[2px] bg-blue-500/50 rounded-full"></span>
          </span>
        </motion.p>
        
        <motion.h1 
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6, delay: 0.1 }}
          className="mb-6 leading-[0.95]"
        >
          <span className="block text-5xl sm:text-7xl md:text-8xl lg:text-[7rem] font-bold tracking-tighter text-transparent bg-clip-text bg-gradient-to-br from-gray-900 via-gray-700 to-gray-500 dark:from-white dark:via-gray-200 dark:to-gray-500 pb-2">
            I'm Pranava
          </span>
          <span className="block text-5xl sm:text-7xl md:text-8xl lg:text-[7rem] font-bold tracking-tighter text-transparent bg-clip-text bg-gradient-to-br from-blue-600 via-blue-500 to-indigo-600 dark:from-accent dark:via-blue-400 dark:to-indigo-600 pb-2">
            Chaitanya
          </span>
        </motion.h1>

        <motion.div 
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6, delay: 0.2 }}
          className="flex flex-wrap items-center gap-4 mb-8 justify-center"
        >
          <span className="flex items-center gap-2">
            <span className="text-xs sm:text-sm tracking-widest uppercase font-mono text-gray-600 dark:text-gray-300">Full-Stack Developer</span>
          </span>
          <span className="flex items-center gap-2">
            <span className="w-1.5 h-1.5 rounded-full bg-blue-500/50"></span>
            <span className="text-xs sm:text-sm tracking-widest uppercase font-mono text-gray-600 dark:text-gray-300">Competitive Programmer</span>
          </span>
          <span className="flex items-center gap-2">
            <span className="w-1.5 h-1.5 rounded-full bg-blue-500/50"></span>
            <span className="text-xs sm:text-sm tracking-widest uppercase font-mono text-gray-600 dark:text-gray-300">Builder</span>
          </span>
        </motion.div>

        <motion.p 
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6, delay: 0.3 }}
          className="max-w-2xl mx-auto text-base md:text-lg leading-relaxed mb-10 text-gray-600 dark:text-gray-400"
        >
          I craft performant web applications, solve complex algorithmic challenges, and build intelligent systems that push boundaries.
        </motion.p>

        <motion.div 
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6, delay: 0.4 }}
          className="flex flex-col sm:flex-row items-center justify-center gap-4 mb-12"
        >
          <a 
            href="#projects" 
            className="px-8 py-4 text-xs sm:text-sm tracking-[0.2em] uppercase font-bold rounded-xl transition-all duration-300 hover:scale-105 hover:shadow-lg hover:shadow-blue-500/20 bg-gray-900 text-white dark:bg-white dark:text-black flex items-center gap-2"
          >
            View Work
          </a>
          <a 
            href="mailto:pranavachaitanyaballa@gmail.com" 
            className="px-8 py-4 text-xs sm:text-sm tracking-[0.2em] uppercase font-bold rounded-xl transition-all duration-300 hover:scale-105 border border-gray-300 dark:border-white/20 text-gray-900 dark:text-white flex items-center gap-2"
          >
            <Mail size={16} /> Contact Me
          </a>
        </motion.div>

        <motion.div 
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6, delay: 0.5 }}
          className="flex items-center gap-4 justify-center"
        >
          <a href="https://github.com/pranava2408" target="_blank" rel="noopener noreferrer" className="w-12 h-12 rounded-full border border-gray-200 dark:border-white/10 flex items-center justify-center text-gray-500 hover:text-gray-900 hover:border-gray-900 dark:text-gray-400 dark:hover:text-white dark:hover:border-blue-400 hover:scale-110 transition-all bg-gray-50 dark:bg-white/[0.02]">
            <GithubIcon size={18} />
          </a>
          <a href="https://linkedin.com/in/balla-pranava-chaitanya-59b84628a" target="_blank" rel="noopener noreferrer" className="w-12 h-12 rounded-full border border-gray-200 dark:border-white/10 flex items-center justify-center text-gray-500 hover:text-gray-900 hover:border-gray-900 dark:text-gray-400 dark:hover:text-white dark:hover:border-blue-400 hover:scale-110 transition-all bg-gray-50 dark:bg-white/[0.02]">
            <LinkedinIcon size={18} />
          </a>
        </motion.div>
      </div>
    </section>
  );
}
