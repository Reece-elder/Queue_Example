import React, { useEffect, useState } from "react";
import axios from "axios";
import Container from "react-bootstrap/Container";
import Row from "react-bootstrap/Row";
import Col from "react-bootstrap/Col";
import TicketList from "./TicketList";
import TicketForm from "./TicketForm";
const TicketPage = () => {
  const [ticketData, setTicketData] = useState([]);

  useEffect(() => {
    axios
      .get("http://localhost:8080/getTicket", {
        headers: {
          "Access-Control-Allow-Origin": "*",
        },
      })
      .then(
        (data) => {
          setTicketData(data.data);
          console.log(ticketData);
        },
        (error) => {}
      );
  });

  return (
    <div>
      <h1 className="title">Ticket Page</h1>
      <Container fluid="true" className="m-3">
        <Row>
          <Col lg={4}>
            <TicketForm />
          </Col>
          <Col>
            <TicketList data={ticketData} />
          </Col>
        </Row>
      </Container>
    </div>
  );
};
export default TicketPage;
