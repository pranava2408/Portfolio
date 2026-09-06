"use client";
import { motion } from "framer-motion";

export default function About() {
  const categories = [
    {
      title: "Languages",
      skills: [
        { name: "C/C++", icon: "devicon-cplusplus-plain" },
        { name: "Dart", icon: "devicon-dart-plain" },
        { name: "JavaScript", icon: "devicon-javascript-plain" },
        { name: "TypeScript", icon: "devicon-typescript-plain" },
        { name: "SQL", icon: "devicon-azuresqldatabase-plain" },
        { name: "HTML/CSS", icon: "devicon-html5-plain" },
      ],
    },
    {
      title: "Frontend & Mobile",
      skills: [
        { name: "React", icon: "devicon-react-original" },
        { name: "Next.js", icon: "devicon-nextjs-plain" },
        { name: "Flutter", icon: "devicon-flutter-plain" },
        { name: "Tailwind CSS", icon: "devicon-tailwindcss-plain" },
      ],
    },
    {
      title: "Backend & Database",
      skills: [
        { name: "Node.js", icon: "devicon-nodejs-plain" },
        { name: "Express.js", icon: "devicon-express-original" },
        { name: "MongoDB", icon: "devicon-mongodb-plain" },
        { name: "Firebase", icon: "devicon-firebase-plain" },
      ],
    },
    {
      title: "Tools",
      skills: [
        { name: "Git", icon: "devicon-git-plain" },
        { name: "GitHub", icon: "devicon-github-original" },
        { name: "VS Code", icon: "devicon-vscode-plain" },
        { name: "Postman", icon: "devicon-postman-plain" },
      ],
    },
  ];

  return (
    <section id="about" className="py-24 px-6 md:px-12 bg-[#0a0a0a]">
      <div className="max-w-7xl mx-auto">
        <motion.div
          initial={{ opacity: 0, y: 30 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true, margin: "-100px" }}
          transition={{ duration: 0.5 }}
          className="flex flex-col items-center justify-center mb-16"
        >
          <h1 className="text-sm tracking-[0.3em] uppercase flex items-center gap-3 text-gray-500 mb-4">
            - A Little About Me
          </h1>
          <h2 className="text-3xl md:text-5xl font-semibold tracking-tight text-white text-center">
            Building intelligent solutions
          </h2>
        </motion.div>

        <motion.div
          initial={{ opacity: 0, y: 30 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true, margin: "-100px" }}
          transition={{ duration: 0.5, delay: 0.2 }}
          className="w-full max-w-4xl mx-auto text-center flex flex-col gap-6 text-gray-400 text-lg leading-relaxed mb-24"
        >
          <p>
            I'm a third-year Computer Science Engineering student at NIT Silchar (CGPA: 9.36) and a passionate developer who enjoys solving complex algorithmic problems and building meaningful digital experiences.
          </p>
          <p>
            My primary interests lie in competitive programming and full-stack software development. I thrive at the intersection of AI, performance, and user experience, crafting applications across web and mobile platforms.
          </p>
          <p>
            Beyond development, I actively compete in algorithmic contests, where I have achieved high ratings across platforms like Codeforces and LeetCode, and serve as a Moderator for the Coding Club NIT Silchar.
          </p>
        </motion.div>

        {/* Tech Stack */}
        <div className="flex flex-col items-center justify-center mb-12">
          <h1 className="text-sm tracking-[0.3em] uppercase flex items-center gap-3 text-gray-500 mb-4">
            - Tech Stack
          </h1>
          <h2 className="text-2xl md:text-4xl font-semibold tracking-tight text-white text-center">
            Tools I Work With
          </h2>
        </div>

        <div className="w-full max-w-6xl mx-auto">
          {categories.map((category, idx) => (
            <motion.div
              key={idx}
              initial={{ opacity: 0, y: 25 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true, margin: "-50px" }}
              transition={{ duration: 0.5, delay: idx * 0.1 }}
              className="flex flex-col md:flex-row md:items-center border-t border-white/10 py-8 gap-4 md:gap-8"
            >
              <div className="md:w-1/4 shrink-0">
                <h3 className="text-xs tracking-[0.25em] uppercase text-gray-500 font-medium">
                  {category.title}
                </h3>
              </div>
              <div className="md:w-3/4 grid grid-cols-3 sm:grid-cols-4 lg:grid-cols-6 gap-3 md:gap-4">
                {category.skills.map((skill, i) => (
                  <div
                    key={i}
                    className="group relative py-5 px-4 flex flex-col items-center justify-center min-w-[90px] rounded-lg border border-white/[0.06] bg-white/[0.02] cursor-pointer transition-all duration-300 ease-out hover:scale-105 hover:border-white/20 hover:shadow-[0_0_25px_rgba(255,255,255,0.07)]"
                  >
                    <i className={`${skill.icon} text-3xl md:text-4xl transition-all duration-300 text-gray-400 group-hover:text-white`}></i>
                    <span className="mt-3 text-[10px] sm:text-xs text-gray-500 font-medium tracking-wide whitespace-nowrap transition-colors duration-300 group-hover:text-gray-300">
                      {skill.name}
                    </span>
                  </div>
                ))}
              </div>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
}
