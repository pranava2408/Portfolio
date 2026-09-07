"use client";
import { motion } from "framer-motion";
import { Mail, BarChart2, ArrowUpRight, Copy } from "lucide-react";
import { useState } from "react";

const GithubIcon = ({ size = 24, className = "" }) => (
  <svg xmlns="http://www.w3.org/2000/svg" width={size} height={size} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" className={className}>
    <path d="M15 22v-4a4.8 4.8 0 0 0-1-3.02c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77 5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A4.8 4.8 0 0 0 8 18v4"></path>
  </svg>
);

const LinkedinIcon = ({ size = 24, className = "" }) => (
  <svg xmlns="http://www.w3.org/2000/svg" width={size} height={size} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" className={className}>
    <path d="M16 8a6 6 0 0 1 6 6v7h-4v-7a2 2 0 0 0-2-2 2 2 0 0 0-2 2v7h-4v-7a6 6 0 0 1 6-6z"></path>
    <rect x="2" y="9" width="4" height="12"></rect>
    <circle cx="4" cy="4" r="2"></circle>
  </svg>
);

export default function Contact() {
  const [copied, setCopied] = useState(false);

  const handleCopy = async () => {
    await navigator.clipboard.writeText("pranavachaitanya@gmail.com");
    setCopied(true);
    setTimeout(() => setCopied(false), 2000);
  };

  const contactLinks = [
    {
      title: "EMAIL",
      subtitle: "pranavachaitanya@gmail.com",
      icon: <Mail size={24} className="text-red-400" />,
      link: "mailto:pranavachaitanya@gmail.com",
      bgTint: "bg-red-400/10",
      action: handleCopy,
      actionIcon: <Copy size={16} className="text-white" />,
    },
    {
      title: "GITHUB",
      subtitle: "pranava2408",
      icon: <GithubIcon size={24} className="text-white" />,
      link: "https://github.com/pranava2408",
      bgTint: "bg-white/10",
    },
    {
      title: "LINKEDIN",
      subtitle: "Connect on LinkedIn",
      icon: <LinkedinIcon size={24} className="text-blue-400" />,
      link: "https://www.linkedin.com/in/balla-pranava-chaitanya-59b84628a/",
      bgTint: "bg-blue-400/10",
    },
    {
      title: "CODEFORCES",
      subtitle: "Competitive Profile",
      icon: <BarChart2 size={24} className="text-green-400" />,
      link: "https://codeforces.com/profile/pranav2408",
      bgTint: "bg-green-400/10",
    },
  ];

  return (
    <section id="contact" className="py-24 px-6 md:px-12 bg-[#030303] flex flex-col items-center">
      <div className="flex flex-col items-center justify-center mb-16 max-w-6xl mx-auto">
        <motion.h1
          initial={{ opacity: 0, y: 30 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true, margin: "-100px" }}
          transition={{ duration: 0.5 }}
          className="text-sm tracking-[0.3em] uppercase flex items-center gap-3 text-gray-500 mb-4"
        >
          - Contact
        </motion.h1>
        <motion.h2
          initial={{ opacity: 0, y: 30 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true, margin: "-100px" }}
          transition={{ duration: 0.5, delay: 0.1 }}
          className="text-3xl md:text-5xl font-semibold tracking-tight text-white mb-6 text-center"
        >
          Let's Work Together
        </motion.h2>
      </div>

      <div className="max-w-4xl mx-auto w-full grid grid-cols-1 md:grid-cols-2 gap-4 md:gap-6">
        {contactLinks.map((item, idx) => (
          <motion.a
            key={idx}
            href={item.link}
            target={item.title !== "EMAIL" ? "_blank" : undefined}
            rel="noopener noreferrer"
            onClick={(e) => {
              if (item.action) {
                e.preventDefault();
                item.action();
              }
            }}
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ duration: 0.4, delay: idx * 0.1 }}
            className="group relative flex items-center p-6 bg-[#111111] rounded-2xl border border-white/[0.05] hover:border-white/[0.3] transition-all duration-300 hover:shadow-[0_0_30px_rgba(255,255,255,0.03)] cursor-pointer"
          >
            <div className={`w-12 h-12 rounded-xl flex items-center justify-center mr-5 ${item.bgTint}`}>
              {item.icon}
            </div>
            
            <div className="flex-1">
              <h3 className="text-[11px] font-semibold text-gray-400 tracking-[0.15em] mb-1">
                {item.title}
              </h3>
              <p className="text-[15px] font-medium text-white truncate max-w-[200px] sm:max-w-xs">
                {item.title === "EMAIL" && copied ? "Copied to clipboard!" : item.subtitle}
              </p>
            </div>
            
            <div className="flex items-center gap-3 opacity-50 group-hover:opacity-100 transition-opacity">
              {item.actionIcon && (
                <div className="hidden group-hover:block transition-all">
                  {item.actionIcon}
                </div>
              )}
              <ArrowUpRight size={18} className="text-white" />
            </div>
          </motion.a>
        ))}
      </div>
      
      <motion.p
        initial={{ opacity: 0, y: 20 }}
        whileInView={{ opacity: 1, y: 0 }}
        viewport={{ once: true }}
        transition={{ duration: 0.5, delay: 0.4 }}
        className="text-gray-500 text-sm mt-12 text-center"
      >
        Prefer email? I typically respond within 24 hours.
      </motion.p>
    </section>
  );
}
