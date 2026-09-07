"use client";

export default function Footer() {
  return (
    <footer className="w-full py-8 border-t border-white/[0.05] bg-[#030303] text-center flex flex-col items-center justify-center">
      <div className="flex items-center gap-2 mb-4">
        <span className="bg-white text-black px-2 py-1 rounded-md text-xs font-bold tracking-tight">PC</span>
        <span className="text-gray-400 font-mono tracking-tighter text-sm">Pranava.</span>
      </div>
      <p className="text-xs text-gray-600 font-mono tracking-wider">
        © {new Date().getFullYear()} BALLA PRANAVA CHAITANYA. ALL RIGHTS RESERVED.
      </p>
      <p className="text-[10px] text-gray-700 mt-2 font-mono">
        BUILT WITH NEXT.JS & TAILWIND CSS
      </p>
    </footer>
  );
}
