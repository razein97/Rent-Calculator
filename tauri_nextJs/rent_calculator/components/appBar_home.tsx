import React from "react";
import SidebarHome from "./sidebar_home";

export default function AppBarHome() {
  return (
    <header className="sticky top-0 z-30  h-14	 w-full  bg-white p-2 drop-shadow  ">
      {/* <div className="flex items-center justify-center md:w-1/5"></div> */}

      <div className=" flex-1 items-center justify-center space-x-8 md:flex">
        <SidebarHome />
      </div>

      {/* <div className="flex items-center justify-center gap-x-4 md:w-1/5">
      <BiSearch className="headerIcon" />
      {session ? (
        <button>
          <BiUserCircle className="headerIcon" />
        </button>
      ) : (
        <button onClick={() => {}}>
          <BiUserPlus className="headerIcon" />
        </button>
      )}
    </div> */}
    </header>
  );
}
