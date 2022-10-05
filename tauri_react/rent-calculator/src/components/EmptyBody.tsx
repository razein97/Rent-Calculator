import React from "react";

export default function EmptyBody() {
  return (
    <div className="grid  h-screen w-full place-items-center  bg-[#1D2125]">
      <div className="">
        <p className="text-center text-3xl text-white ">
          Welcome to Rent Calculator
        </p>
        <p className="text-center text-base text-white">
          Use the + button to add your first building.
        </p>
      </div>
    </div>
  );
}
