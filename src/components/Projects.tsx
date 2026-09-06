"use client";
import { motion } from "framer-motion";
import { ExternalLink } from "lucide-react";
import Link from "next/link";

const GithubIcon = ({ size = 24 }) => (
  <svg xmlns="http://www.w3.org/2000/svg" width={size} height={size} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
    <path d="M15 22v-4a4.8 4.8 0 0 0-1-3.02c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77 5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A4.8 4.8 0 0 0 8 18v4"></path>
  </svg>
);

export default function Projects() {
  const projects = [
    {
      title: "School Management System (Axiora)",
      description:
        "A comprehensive platform engineered with an AI 'Doubt Solver' using the Google Gemini API to deliver on-demand, LaTeX-formatted academic explanations for students. Includes automated school-wide email notifications.",
      tech: ["MongoDB", "Express.js", "React", "Node.js", "Gemini AI", "Nodemailer", "Razorpay"],
      github: "https://github.com/pranava2408/axiora", // Update if actual link is different
      website: "#", // Update if actual link exists
    },
    {
      title: "OSPAT (Online Skills Proctoring & Assessment Tool)",
      description:
        "Engineered a companion mobile application for secure candidate proctoring, integrating Stream Video API for low-latency WebRTC. Architected a synchronous backend code execution engine to compile and monitor across 10+ languages.",
      tech: ["React.js", "Flutter", "Node.js", "Stream Video API", "OnlineCompiler API"],
      github: "https://github.com/pranava2408/ospat", // Update if actual link is different
      website: "#", // Update if actual link exists
    },
  ];

  return (
    <section id="projects" className="py-24 px-6 md:px-12">
      <div className="max-w-7xl mx-auto">
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true, margin: "-100px" }}
          transition={{ duration: 0.5 }}
          className="mb-16 flex items-center gap-4"
        >
          <h2 className="text-3xl md:text-4xl font-bold text-white tracking-tight">Some Things I've Built</h2>
          <div className="h-[1px] bg-gray-700 flex-1 max-w-[300px]"></div>
        </motion.div>

        <div className="space-y-24">
          {projects.map((project, idx) => (
            <motion.div
              key={idx}
              initial={{ opacity: 0, y: 40 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true, margin: "-100px" }}
              transition={{ duration: 0.7 }}
              className={`relative flex flex-col md:flex-row items-center gap-8 ${
                idx % 2 !== 0 ? "md:flex-row-reverse" : ""
              }`}
            >
              {/* Project Image Placeholder */}
              <div className="w-full md:w-3/5 group relative">
                <div className="absolute inset-0 bg-accent/20 group-hover:bg-transparent transition-colors duration-300 z-10 rounded-xl" />
                <div className="relative w-full aspect-video bg-gray-800 rounded-xl overflow-hidden flex items-center justify-center border border-gray-700">
                   <div className="text-gray-500 font-mono text-xl">Project Snapshot</div>
                </div>
              </div>

              {/* Project Info */}
              <div className={`w-full md:w-2/5 flex flex-col ${idx % 2 !== 0 ? "md:items-start" : "md:items-end"}`}>
                <p className="text-accent text-sm font-mono mb-2">Featured Project</p>
                <h3 className="text-2xl font-bold text-white mb-6 hover:text-accent transition-colors">
                  <a href={project.website}>{project.title}</a>
                </h3>

                <div className={`bg-[#111827] p-6 rounded-xl border border-gray-800 shadow-2xl relative z-20 text-gray-400 text-base leading-relaxed ${idx % 2 !== 0 ? "md:text-left" : "md:text-right"}`}>
                  {project.description}
                </div>

                <ul className={`flex flex-wrap gap-4 mt-6 text-sm font-mono text-gray-500 ${idx % 2 !== 0 ? "justify-start" : "justify-end"}`}>
                  {project.tech.map((item, i) => (
                    <li key={i}>{item}</li>
                  ))}
                </ul>

                <div className={`flex items-center gap-4 mt-6 ${idx % 2 !== 0 ? "justify-start" : "justify-end"}`}>
                  <Link href={project.github} className="text-gray-400 hover:text-accent transition-colors">
                    <GithubIcon size={22} />
                  </Link>
                  <Link href={project.website} className="text-gray-400 hover:text-accent transition-colors">
                    <ExternalLink size={22} />
                  </Link>
                </div>
              </div>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
}
