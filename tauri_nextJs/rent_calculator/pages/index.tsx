import Head from "next/head";
import Image from "next/image";
import AppBarHome from "../components/appBar_home";
import styles from "../styles/Home.module.css";
import { BiSearchAlt2 } from "react-icons/bi";
import Header from "../components/header";

export default function Home() {
  return (
    <div className="flex min-h-screen w-full flex-col bg-slate-800">
      <Header />
    </div>
  );
}
