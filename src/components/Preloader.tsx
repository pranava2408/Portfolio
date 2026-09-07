"use client";
import { useEffect, useState } from "react";
import { motion, AnimatePresence } from "framer-motion";

export default function Preloader() {
  const [loading, setLoading] = useState(true);
  
  // Entire name
  const name = "BALLA PRANAVA CHAITANYA";
  
  useEffect(() => {
    // Wait for the typing animation (approx 2s) + some delay before hiding
    const timer = setTimeout(() => {
      setLoading(false);
    }, 3500);
    return () => clearTimeout(timer);
  }, []);

  return (
    <AnimatePresence>
      {loading && (
        <motion.div
          key="preloader"
          initial={{ opacity: 1 }}
          exit={{ opacity: 0, y: -50 }}
          transition={{ duration: 0.8, ease: [0.76, 0, 0.24, 1] }}
          className="fixed inset-0 z-[100] flex flex-col items-center justify-center bg-gray-50 dark:bg-[#0a0a0a]"
        >
          {/* Subtle animated background noise */}
          <div 
            className="absolute inset-0 pointer-events-none opacity-[0.02] dark:opacity-[0.03] mix-blend-multiply dark:mix-blend-screen"
            style={{ backgroundImage: `url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='noise'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23noise)'/%3E%3C/svg%3E")` }}
          />
          
          <div className="relative z-10 flex flex-col items-center gap-8 px-4 w-full overflow-hidden">
            <motion.h1 
              className="text-4xl md:text-5xl lg:text-7xl font-black tracking-tighter text-gray-900 dark:text-white uppercase flex flex-wrap justify-center gap-x-3 gap-y-2 text-center"
            >
              {name.split(" ").map((word, wordIdx) => (
                <span key={wordIdx} className="inline-flex">
                  {word.split("").map((char, charIdx) => {
                    // Calculate total index for staggered animation
                    const totalIdx = name.split("").findIndex((c, i) => c === char && i >= name.indexOf(word));
                    
                    return (
                      <motion.span
                        key={charIdx}
                        initial={{ opacity: 0, y: 20 }}
                        animate={{ opacity: 1, y: 0 }}
                        transition={{ 
                          duration: 0.4, 
                          delay: (wordIdx * 5 + charIdx) * 0.08,
                          ease: "easeOut"
                        }}
                        className="inline-block"
                      >
                        {char}
                      </motion.span>
                    );
                  })}
                </span>
              ))}
            </motion.h1>
            
            <div className="w-64 flex flex-col items-center mt-4">
              <div className="w-full h-[3px] bg-gray-300 dark:bg-white/10 rounded-full overflow-hidden">
                <motion.div 
                  initial={{ width: "0%" }}
                  animate={{ width: "100%" }}
                  transition={{ duration: 2.8, ease: "easeInOut" }}
                  className="h-full bg-blue-600 dark:bg-white"
                />
              </div>
            </div>
          </div>
        </motion.div>
      )}
    </AnimatePresence>
  );
}
