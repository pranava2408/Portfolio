"use client";
import { motion } from "framer-motion";
import { Code2, Database, Layout, Terminal } from "lucide-react";

export default function About() {
  const skills = [
    {
      category: "Languages",
      items: ["C/C++", "Dart", "JavaScript", "TypeScript", "SQL", "HTML/CSS"],
      icon: <Code2 size={20} className="text-accent" />,
    },
    {
      category: "Frameworks & Libs",
      items: ["React", "Next.js", "Flutter", "Node.js", "Express.js", "Tailwind CSS"],
      icon: <Layout size={20} className="text-accent" />,
    },
    {
      category: "Databases",
      items: ["MongoDB", "Firebase", "Mongoose"],
      icon: <Database size={20} className="text-accent" />,
    },
    {
      category: "Tools & Others",
      items: ["Git", "GitHub", "VS Code", "Postman", "Android Studio"],
      icon: <Terminal size={20} className="text-accent" />,
    },
  ];

  return (
    <section id="about" className="py-24 px-6 md:px-12 bg-[#111827]/30">
      <div className="max-w-7xl mx-auto">
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true, margin: "-100px" }}
          transition={{ duration: 0.5 }}
          className="mb-16 flex items-center gap-4"
        >
          <h2 className="text-3xl md:text-4xl font-bold text-white tracking-tight">About Me</h2>
          <div className="h-[1px] bg-gray-700 flex-1 max-w-[300px]"></div>
        </motion.div>

        <div className="grid md:grid-cols-2 gap-16">
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true, margin: "-100px" }}
            transition={{ duration: 0.5, delay: 0.2 }}
            className="text-gray-400 leading-relaxed space-y-6 text-lg"
          >
            <p>
              Hello! I'm Pranava, a passionate developer pursuing my Bachelor of Technology in Computer Science and Engineering at the 
              <strong className="text-white"> National Institute of Technology, Silchar</strong> (CGPA: 9.36).
            </p>
            <p>
              My journey in software development began with building robust backend systems, and I quickly expanded into crafting 
              full-stack applications across web and mobile platforms. I thrive at the intersection of AI, performance, and user experience.
            </p>
            <p>
              Beyond development, I am deeply involved in competitive programming and algorithm design, where I actively compete and create problems for flagship national contests. 
              I also serve as the Moderator for the Coding Club NIT Silchar, mentoring over 100 students in advanced algorithmic topics.
            </p>
          </motion.div>

          <motion.div
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true, margin: "-100px" }}
            transition={{ duration: 0.5, delay: 0.4 }}
          >
            <h3 className="text-xl font-semibold text-white mb-6">Technical Arsenal</h3>
            <div className="grid sm:grid-cols-2 gap-6">
              {skills.map((skillGroup, idx) => (
                <div key={idx} className="bg-gray-800/30 border border-gray-700/50 rounded-xl p-5 hover:border-accent/50 transition-colors">
                  <div className="flex items-center gap-3 mb-4">
                    {skillGroup.icon}
                    <h4 className="text-white font-medium">{skillGroup.category}</h4>
                  </div>
                  <ul className="space-y-2">
                    {skillGroup.items.map((item, i) => (
                      <li key={i} className="text-gray-400 text-sm flex items-center gap-2">
                        <span className="w-1.5 h-1.5 rounded-full bg-accent/50"></span>
                        {item}
                      </li>
                    ))}
                  </ul>
                </div>
              ))}
            </div>
          </motion.div>
        </div>
      </div>
    </section>
  );
}
