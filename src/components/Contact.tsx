"use client";
import { motion } from "framer-motion";

export default function Contact() {
  return (
    <section id="contact" className="py-32 px-6 md:px-12 text-center">
      <div className="max-w-2xl mx-auto">
        <motion.p
          initial={{ opacity: 0, y: 20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          transition={{ duration: 0.5 }}
          className="text-accent font-mono mb-4"
        >
          What's Next?
        </motion.p>
        
        <motion.h2
          initial={{ opacity: 0, y: 20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          transition={{ duration: 0.5, delay: 0.1 }}
          className="text-4xl md:text-5xl font-bold text-white mb-6"
        >
          Get In Touch
        </motion.h2>
        
        <motion.p
          initial={{ opacity: 0, y: 20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          transition={{ duration: 0.5, delay: 0.2 }}
          className="text-gray-400 text-lg mb-10 leading-relaxed"
        >
          Whether you have a question, a project idea, or just want to say hi, my inbox is always open. 
          I'll try my best to get back to you!
        </motion.p>
        
        <motion.a
          initial={{ opacity: 0, y: 20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          transition={{ duration: 0.5, delay: 0.3 }}
          href="mailto:pranavachaitanyaballa@gmail.com"
          className="inline-block px-8 py-4 border border-accent text-accent rounded-lg font-mono hover:bg-accent/10 transition-colors"
        >
          Say Hello
        </motion.a>
      </div>
      
      <footer className="mt-32 pt-8 border-t border-gray-800 text-sm text-gray-500 font-mono">
        <p>Built with Next.js, Tailwind CSS & Framer Motion</p>
        <p className="mt-2">© {new Date().getFullYear()} Balla Pranava Chaitanya</p>
      </footer>
    </section>
  );
}
