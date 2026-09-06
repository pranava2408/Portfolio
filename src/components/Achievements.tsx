"use client";
import { motion } from "framer-motion";

export default function Achievements() {
  const achievements = [
    {
      title: "Code With Cisco 2026 Finalist",
      year: "2026",
      desc: "Ranked top 75 out of 30,000+ participants, advancing to the final round held at the Cisco campus.",
    },
    {
      title: "Amazon Hackon Prototype Submission",
      year: "2026",
      desc: "Successfully advanced to the prototype submission round, showcasing innovative system design and problem-solving.",
    },
    {
      title: "ICPC Regionalist 2025",
      year: "2025",
      desc: "Secured Rank 29 in the Chennai Regional (Onsite) representing NIT Silchar. Qualified for both Amritapuri and Chennai Regionals, achieving a Preliminary Rank of 117 nationally.",
    },
    {
      title: "Meta Hacker Cup 2025",
      year: "2025",
      desc: "Advanced to Round 2 and secured a top 2000 rank (Rank 674), placing in the top 3% of global participants from the Qualification Round.",
    },
  ];

  const cpStats = [
    { platform: "Codeforces", rating: "1817 (Expert)", desc: "Ranked in the top 0.75% of all active Indian competitive programmers." },
    { platform: "CodeChef", rating: "2001 (5-Star)", desc: "Ranked among the top competitive programmers on CodeChef." },
    { platform: "LeetCode", rating: "2146 (Guardian)", desc: "Excelled within the top 1.23% of over 500,000 active users." },
  ];

  return (
    <section id="achievements" className="py-24 px-6 md:px-12 bg-[#0a0a0a]">
      <div className="flex flex-col items-center justify-center mb-16 max-w-6xl mx-auto">
        <motion.h1
          initial={{ opacity: 0, y: 30 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true, margin: "-100px" }}
          transition={{ duration: 0.5 }}
          className="text-sm tracking-[0.3em] uppercase flex items-center gap-3 text-gray-500 mb-4"
        >
          - Achievements
        </motion.h1>
        <motion.h2
          initial={{ opacity: 0, y: 30 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true, margin: "-100px" }}
          transition={{ duration: 0.5, delay: 0.1 }}
          className="text-3xl md:text-5xl font-semibold tracking-tight text-white mb-6 text-center"
        >
          Milestones & Rankings
        </motion.h2>
      </div>

      <div className="max-w-6xl mx-auto grid lg:grid-cols-2 gap-16">
        {/* Hackathons & Competitions */}
        <div>
          <motion.h3 
            initial={{ opacity: 0, x: -20 }}
            whileInView={{ opacity: 1, x: 0 }}
            viewport={{ once: true }}
            className="text-xl tracking-[0.2em] uppercase text-white mb-8 border-b border-white/10 pb-4"
          >
            Competitions
          </motion.h3>
          <div className="space-y-2">
            {achievements.map((item, idx) => (
              <motion.div
                key={idx}
                initial={{ opacity: 0, y: 20 }}
                whileInView={{ opacity: 1, y: 0 }}
                viewport={{ once: true, margin: "-50px" }}
                transition={{ duration: 0.4, delay: idx * 0.1 }}
                className="group p-6 rounded-xl border border-white/[0.04] bg-white/[0.01] hover:bg-white/[0.03] hover:border-white/10 transition-all"
              >
                <div className="flex justify-between items-start mb-2 gap-4">
                  <h4 className="text-lg font-semibold text-gray-200 group-hover:text-white transition-colors">{item.title}</h4>
                  <span className="text-xs font-mono text-gray-500 shrink-0 mt-1">{item.year}</span>
                </div>
                <p className="text-gray-400 text-sm leading-relaxed">{item.desc}</p>
              </motion.div>
            ))}
          </div>
        </div>

        {/* CP Profiles */}
        <div>
          <motion.h3 
            initial={{ opacity: 0, x: 20 }}
            whileInView={{ opacity: 1, x: 0 }}
            viewport={{ once: true }}
            className="text-xl tracking-[0.2em] uppercase text-white mb-8 border-b border-white/10 pb-4"
          >
            Competitive Programming
          </motion.h3>
          <div className="space-y-4">
            {cpStats.map((stat, idx) => (
              <motion.div
                key={idx}
                initial={{ opacity: 0, y: 20 }}
                whileInView={{ opacity: 1, y: 0 }}
                viewport={{ once: true, margin: "-50px" }}
                transition={{ duration: 0.4, delay: idx * 0.1 }}
                className="group p-6 rounded-xl border border-white/[0.04] bg-white/[0.01] hover:bg-white/[0.03] hover:border-white/10 transition-all flex flex-col justify-center h-[120px]"
              >
                <div className="flex justify-between items-center mb-2">
                  <h4 className="text-xl font-bold text-gray-200 group-hover:text-white transition-colors">{stat.platform}</h4>
                  <span className="text-accent font-mono font-semibold px-3 py-1 bg-accent/10 rounded-full">{stat.rating}</span>
                </div>
                <p className="text-gray-400 text-sm">{stat.desc}</p>
              </motion.div>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
}
