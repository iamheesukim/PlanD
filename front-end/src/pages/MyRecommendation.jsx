import React from "react";
import Header from "../components/header/Header";
import { BodyLayout } from "../components/body/mixin/Mixin";
import Footer from "../components/footer/Footer";
import UserRecommendation from "./UserRecommendation";

const MyRecommendation = () => {
  return (
    <>
      <Header />
      <BodyLayout></BodyLayout>
      <Footer />
    </>
  );
};

export default MyRecommendation;
