"use client";
import { motion } from "framer-motion";
import { Trophy, Code, Medal, Star } from "lucide-react";

export default function Achievements() {
  const achievements = [
    {
      title: "Code With Cisco 2026 Finalist",
      desc: "Ranked top 75 out of 30,000+ participants, advancing to the final round held at the Cisco campus.",
      icon: <Trophy size={24} className="text-yellow-500" />,
    },
    {
      title: "Amazon Hackon Prototype Submission",
      desc: "Successfully advanced to the prototype submission round, showcasing innovative system design and problem-solving.",
      icon: <Medal size={24} className="text-orange-500" />,
    },
    {
      title: "ICPC Regionalist 2025",
      desc: "Secured Rank 29 in the Chennai Regional (Onsite) representing NIT Silchar. Qualified for both Amritapuri and Chennai Regionals, achieving a Preliminary Rank of 117 nationally.",
      icon: <Code size={24} className="text-blue-500" />,
    },
    {
      title: "Meta Hacker Cup 2025",
      desc: "Advanced to Round 2 and secured a top 2000 rank (Rank 674), placing in the top 3% of global participants from the Qualification Round.",
      icon: <Code size={24} className="text-blue-400" />,
    },
  ];

  const cpStats = [
    { platform: "Codeforces", rating: "1817 (Expert)", desc: "Ranked in the top 0.75% of all active Indian competitive programmers." },
    { platform: "CodeChef", rating: "2001 (5-Star)", desc: "Ranked among the top competitive programmers on CodeChef." },
    { platform: "LeetCode", rating: "2146 (Guardian)", desc: "Excelled within the top 1.23% of over 500,000 active users." },
  ];

  return (
    <section id="achievements" className="py-24 px-6 md:px-12 bg-[#111827]/30">
      <div className="max-w-7xl mx-auto">
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true, margin: "-100px" }}
          transition={{ duration: 0.5 }}
          className="mb-16 flex items-center gap-4"
        >
          <h2 className="text-3xl md:text-4xl font-bold text-white tracking-tight">Achievements & Profiles</h2>
          <div className="h-[1px] bg-gray-700 flex-1 max-w-[300px]"></div>
        </motion.div>

        <div className="grid lg:grid-cols-2 gap-16">
          {/* Hackathons & Competitions */}
          <div>
            <h3 className="text-2xl font-semibold text-white mb-8 flex items-center gap-3">
              <Trophy className="text-accent" /> Competitions
            </h3>
            <div className="space-y-6">
              {achievements.map((item, idx) => (
                <motion.div
                  key={idx}
                  initial={{ opacity: 0, x: -20 }}
                  whileInView={{ opacity: 1, x: 0 }}
                  viewport={{ once: true, margin: "-100px" }}
                  transition={{ duration: 0.5, delay: idx * 0.1 }}
                  className="bg-gray-800/40 border border-gray-700/50 p-6 rounded-xl hover:border-accent/50 transition-colors flex gap-4"
                >
                  <div className="mt-1">{item.icon}</div>
                  <div>
                    <h4 className="text-lg font-semibold text-gray-100">{item.title}</h4>
                    <p className="text-gray-400 mt-2 text-sm leading-relaxed">{item.desc}</p>
                  </div>
                </motion.div>
              ))}
            </div>
          </div>

          {/* CP Profiles */}
          <div>
            <h3 className="text-2xl font-semibold text-white mb-8 flex items-center gap-3">
              <Star className="text-accent" /> Competitive Programming
            </h3>
            <div className="grid gap-6">
              {cpStats.map((stat, idx) => (
                <motion.div
                  key={idx}
                  initial={{ opacity: 0, x: 20 }}
                  whileInView={{ opacity: 1, x: 0 }}
                  viewport={{ once: true, margin: "-100px" }}
                  transition={{ duration: 0.5, delay: idx * 0.1 }}
                  className="bg-gray-800/40 border border-gray-700/50 p-6 rounded-xl hover:border-accent/50 transition-colors"
                >
                  <div className="flex justify-between items-center mb-2">
                    <h4 className="text-xl font-bold text-gray-100">{stat.platform}</h4>
                    <span className="text-accent font-mono font-semibold">{stat.rating}</span>
                  </div>
                  <p className="text-gray-400 text-sm">{stat.desc}</p>
                </motion.div>
              ))}
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
