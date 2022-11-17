import React from "react";
import Head from "next/head";
import Link from "next/link";
import AppBarHome from "../components/appBar_home";

function Home() {
  return (
    <div className="flex min-h-screen w-full flex-col bg-neutral-800">
      <AppBarHome />
    </div>
  );
}

export default Home;
