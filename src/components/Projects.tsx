"use client";
import { motion } from "framer-motion";
import { ExternalLink } from "lucide-react";
import Image from "next/image";

const GithubIcon = ({ size = 24 }) => (
  <svg xmlns="http://www.w3.org/2000/svg" width={size} height={size} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
    <path d="M15 22v-4a4.8 4.8 0 0 0-1-3.02c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77 5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A4.8 4.8 0 0 0 8 18v4"></path>
  </svg>
);

export default function Projects() {
  const projects = [
    {
      title: "Axiora - School Management System",
      year: "2026",
      description: "A comprehensive platform engineered with an AI 'Doubt Solver' using the Google Gemini API to deliver on-demand, LaTeX-formatted academic explanations for students. Includes automated school-wide email notifications.",
      tech: ["MongoDB", "Express.js", "React", "Node.js", "Gemini AI", "Nodemailer", "Razorpay"],
      github: "https://github.com/pranava2408", 
      website: "#", 
      image: "/axiora.png"
    },
    {
      title: "OSPAT - Online Skills Proctoring",
      year: "2025",
      description: "Engineered a companion mobile application for secure candidate proctoring, integrating Stream Video API for low-latency WebRTC. Architected a synchronous backend code execution engine to compile and monitor across 10+ languages.",
      tech: ["React.js", "Flutter", "Node.js", "Stream Video API", "OnlineCompiler API"],
      github: "https://github.com/pranava2408", 
      website: "#", 
      image: "/ospat.png"
    },
  ];

  return (
    <section id="projects" className="py-24 px-6 md:px-12 bg-[#030303]">
      <div className="flex flex-col items-center justify-center mb-16 max-w-6xl mx-auto">
        <motion.h1
          initial={{ opacity: 0, y: 30 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true, margin: "-100px" }}
          transition={{ duration: 0.5 }}
          className="text-sm tracking-[0.3em] uppercase flex items-center gap-3 text-gray-500 mb-4"
        >
          - Selected Works
        </motion.h1>
        <motion.h2
          initial={{ opacity: 0, y: 30 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true, margin: "-100px" }}
          transition={{ duration: 0.5, delay: 0.1 }}
          className="text-3xl md:text-5xl font-semibold tracking-tight text-white mb-6"
        >
          Featured Projects
        </motion.h2>
      </div>

      <div className="max-w-6xl mx-auto space-y-12">
        {projects.map((project, idx) => (
          <motion.div
            key={idx}
            initial={{ opacity: 0, y: 30 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true, margin: "-100px" }}
            transition={{ duration: 0.5, delay: idx * 0.1 }}
          >
            <div className="group border border-white/[0.08] bg-white/[0.01] transition-colors duration-300 hover:bg-white/[0.02] rounded-2xl overflow-hidden flex flex-col md:flex-row items-center gap-8 p-6 md:p-8">
              
              <div className="w-full md:w-1/2 relative rounded-xl overflow-hidden border border-white/[0.05] shadow-lg shadow-black/50 group-hover:shadow-accent/5 transition-all">
                 <div className="aspect-video relative w-full">
                    <Image src={project.image} alt={project.title} fill className="object-cover object-top transition-transform duration-700 group-hover:scale-105" />
                 </div>
              </div>

              <div className="w-full md:w-1/2 flex flex-col justify-center">
                <div className="flex items-start justify-between gap-4 mb-2">
                  <h3 className="text-xl md:text-3xl font-semibold text-[#e5e5e5] group-hover:text-white transition-colors duration-300">
                    {project.title}
                  </h3>
                  <div className="flex gap-4 items-center shrink-0 mt-1">
                    <a href={project.github} target="_blank" rel="noopener noreferrer" className="text-gray-500 hover:text-white transition-colors duration-300">
                      <GithubIcon size={22} />
                    </a>
                    <a href={project.website} target="_blank" rel="noopener noreferrer" className="text-gray-500 hover:text-white transition-colors duration-300">
                      <ExternalLink size={22} />
                    </a>
                  </div>
                </div>
                <p className="text-sm text-gray-500 mb-6 font-mono">{project.year}</p>
                
                <p className="text-base md:text-lg text-gray-400 leading-relaxed mb-8">
                  {project.description}
                </p>
                
                <div className="flex flex-wrap gap-2">
                  {project.tech.map((item, i) => (
                    <span
                      key={i}
                      className="px-3 py-1.5 text-xs rounded-full border border-white/[0.1] text-gray-400 bg-white/[0.03]"
                    >
                      {item}
                    </span>
                  ))}
                </div>
              </div>
            </div>
          </motion.div>
        ))}
      </div>
    </section>
  );
}
