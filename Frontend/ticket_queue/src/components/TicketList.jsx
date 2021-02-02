import React from "react";
import CardGroup from "react-bootstrap/CardGroup";
import Ticket from "./Ticket";
const TicketList = ({ data }) => {
  return (
    <CardGroup>
      {data.map((ticket) => (
        <Ticket
          id={ticket.id}
          title={ticket.title}
          description={ticket.description}
          timestamp={ticket.timestamp}
          status={ticket.status}
          author={ticket.author}
        />
      ))}
    </CardGroup>
  );
};
export default TicketList;
