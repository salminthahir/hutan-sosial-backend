--
-- PostgreSQL database dump
--

\restrict owK8acSdouugqC9eHMcgsVZ0WuSMl6dpkoXLk7SC5k38ghCOeoPNx77ToIAakb7

-- Dumped from database version 17.8 (Homebrew)
-- Dumped by pg_dump version 17.8 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: BiophysicalProfiles; Type: TABLE; Schema: public; Owner: hutan_kita_user
--

CREATE TABLE public."BiophysicalProfiles" (
    id integer NOT NULL,
    "permitId" integer,
    "rainfallMm" numeric(8,2),
    "rainfallCategory" character varying(50),
    "elevationM" numeric(8,2),
    "soilType" character varying(100),
    "slopePercent" numeric(5,2),
    "slopeCategory" character varying(50),
    notes text,
    "yearRecorded" integer,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."BiophysicalProfiles" OWNER TO hutan_kita_user;

--
-- Name: BiophysicalProfiles_id_seq; Type: SEQUENCE; Schema: public; Owner: hutan_kita_user
--

CREATE SEQUENCE public."BiophysicalProfiles_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."BiophysicalProfiles_id_seq" OWNER TO hutan_kita_user;

--
-- Name: BiophysicalProfiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hutan_kita_user
--

ALTER SEQUENCE public."BiophysicalProfiles_id_seq" OWNED BY public."BiophysicalProfiles".id;


--
-- Name: BusinessReadiness; Type: TABLE; Schema: public; Owner: hutan_kita_user
--

CREATE TABLE public."BusinessReadiness" (
    id integer NOT NULL,
    "institutionId" integer,
    "hasNIB" boolean DEFAULT false,
    "hasBankAccount" boolean DEFAULT false,
    "hasBookkeeping" boolean DEFAULT false,
    "hasKURAccess" boolean DEFAULT false,
    "kurAmount" numeric(15,2),
    "kurBank" character varying(100),
    "readinessScore" numeric(3,2),
    "readinessLevel" character varying(50),
    "yearRecorded" integer,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."BusinessReadiness" OWNER TO hutan_kita_user;

--
-- Name: BusinessReadiness_id_seq; Type: SEQUENCE; Schema: public; Owner: hutan_kita_user
--

CREATE SEQUENCE public."BusinessReadiness_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."BusinessReadiness_id_seq" OWNER TO hutan_kita_user;

--
-- Name: BusinessReadiness_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hutan_kita_user
--

ALTER SEQUENCE public."BusinessReadiness_id_seq" OWNED BY public."BusinessReadiness".id;


--
-- Name: Buyers; Type: TABLE; Schema: public; Owner: hutan_kita_user
--

CREATE TABLE public."Buyers" (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    "buyerType" character varying(50),
    "contactPerson" character varying(200),
    phone character varying(50),
    email character varying(200),
    address text,
    location public.geometry(Point,4326),
    "isActive" boolean DEFAULT true,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Buyers" OWNER TO hutan_kita_user;

--
-- Name: Buyers_id_seq; Type: SEQUENCE; Schema: public; Owner: hutan_kita_user
--

CREATE SEQUENCE public."Buyers_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Buyers_id_seq" OWNER TO hutan_kita_user;

--
-- Name: Buyers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hutan_kita_user
--

ALTER SEQUENCE public."Buyers_id_seq" OWNED BY public."Buyers".id;


--
-- Name: CarryingCapacity; Type: TABLE; Schema: public; Owner: hutan_kita_user
--

CREATE TABLE public."CarryingCapacity" (
    id integer NOT NULL,
    "permitId" integer,
    "capacityScore" numeric(3,2),
    "capacityLevel" character varying(50),
    "overExploitationRisk" boolean DEFAULT false,
    "climateVulnerability" character varying(50),
    "assessmentDate" date,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."CarryingCapacity" OWNER TO hutan_kita_user;

--
-- Name: CarryingCapacity_id_seq; Type: SEQUENCE; Schema: public; Owner: hutan_kita_user
--

CREATE SEQUENCE public."CarryingCapacity_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."CarryingCapacity_id_seq" OWNER TO hutan_kita_user;

--
-- Name: CarryingCapacity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hutan_kita_user
--

ALTER SEQUENCE public."CarryingCapacity_id_seq" OWNED BY public."CarryingCapacity".id;


--
-- Name: Commodities; Type: TABLE; Schema: public; Owner: hutan_kita_user
--

CREATE TABLE public."Commodities" (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    category character varying(50),
    "iconUrl" text,
    description text,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Commodities" OWNER TO hutan_kita_user;

--
-- Name: Commodities_id_seq; Type: SEQUENCE; Schema: public; Owner: hutan_kita_user
--

CREATE SEQUENCE public."Commodities_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Commodities_id_seq" OWNER TO hutan_kita_user;

--
-- Name: Commodities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hutan_kita_user
--

ALTER SEQUENCE public."Commodities_id_seq" OWNED BY public."Commodities".id;


--
-- Name: CommoditySuitabilities; Type: TABLE; Schema: public; Owner: hutan_kita_user
--

CREATE TABLE public."CommoditySuitabilities" (
    id integer NOT NULL,
    "permitId" integer,
    "commodityId" integer,
    "suitabilityScore" numeric(3,2),
    "suitabilityLevel" character varying(20),
    notes text,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."CommoditySuitabilities" OWNER TO hutan_kita_user;

--
-- Name: CommoditySuitabilities_id_seq; Type: SEQUENCE; Schema: public; Owner: hutan_kita_user
--

CREATE SEQUENCE public."CommoditySuitabilities_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."CommoditySuitabilities_id_seq" OWNER TO hutan_kita_user;

--
-- Name: CommoditySuitabilities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hutan_kita_user
--

ALTER SEQUENCE public."CommoditySuitabilities_id_seq" OWNED BY public."CommoditySuitabilities".id;


--
-- Name: DerivedProducts; Type: TABLE; Schema: public; Owner: hutan_kita_user
--

CREATE TABLE public."DerivedProducts" (
    id integer NOT NULL,
    "commodityId" integer,
    name character varying(200) NOT NULL,
    category character varying(100),
    "processDescription" text,
    "valueAddedMultiplier" numeric(5,2),
    "unitPrice" numeric(12,2),
    "priceUnit" character varying(50),
    "marketPotential" character varying(50),
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."DerivedProducts" OWNER TO hutan_kita_user;

--
-- Name: DerivedProducts_id_seq; Type: SEQUENCE; Schema: public; Owner: hutan_kita_user
--

CREATE SEQUENCE public."DerivedProducts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."DerivedProducts_id_seq" OWNER TO hutan_kita_user;

--
-- Name: DerivedProducts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hutan_kita_user
--

ALTER SEQUENCE public."DerivedProducts_id_seq" OWNED BY public."DerivedProducts".id;


--
-- Name: Districts; Type: TABLE; Schema: public; Owner: hutan_kita_user
--

CREATE TABLE public."Districts" (
    id integer NOT NULL,
    "regencyId" integer,
    name character varying(100) NOT NULL,
    code character varying(10),
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Districts" OWNER TO hutan_kita_user;

--
-- Name: Districts_id_seq; Type: SEQUENCE; Schema: public; Owner: hutan_kita_user
--

CREATE SEQUENCE public."Districts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Districts_id_seq" OWNER TO hutan_kita_user;

--
-- Name: Districts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hutan_kita_user
--

ALTER SEQUENCE public."Districts_id_seq" OWNED BY public."Districts".id;


--
-- Name: EnvironmentalRisks; Type: TABLE; Schema: public; Owner: hutan_kita_user
--

CREATE TABLE public."EnvironmentalRisks" (
    id integer NOT NULL,
    "permitId" integer,
    "riskType" character varying(100),
    "riskLevel" character varying(20),
    "riskScore" numeric(3,2),
    zone public.geometry(Polygon,4326),
    description text,
    "mitigationPlan" text,
    "yearAssessed" integer,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."EnvironmentalRisks" OWNER TO hutan_kita_user;

--
-- Name: EnvironmentalRisks_id_seq; Type: SEQUENCE; Schema: public; Owner: hutan_kita_user
--

CREATE SEQUENCE public."EnvironmentalRisks_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."EnvironmentalRisks_id_seq" OWNER TO hutan_kita_user;

--
-- Name: EnvironmentalRisks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hutan_kita_user
--

ALTER SEQUENCE public."EnvironmentalRisks_id_seq" OWNED BY public."EnvironmentalRisks".id;


--
-- Name: ForestAreaStatuses; Type: TABLE; Schema: public; Owner: hutan_kita_user
--

CREATE TABLE public."ForestAreaStatuses" (
    id integer NOT NULL,
    code character varying(10) NOT NULL,
    name character varying(100) NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."ForestAreaStatuses" OWNER TO hutan_kita_user;

--
-- Name: ForestAreaStatuses_id_seq; Type: SEQUENCE; Schema: public; Owner: hutan_kita_user
--

CREATE SEQUENCE public."ForestAreaStatuses_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."ForestAreaStatuses_id_seq" OWNER TO hutan_kita_user;

--
-- Name: ForestAreaStatuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hutan_kita_user
--

ALTER SEQUENCE public."ForestAreaStatuses_id_seq" OWNED BY public."ForestAreaStatuses".id;


--
-- Name: GroupDemographics; Type: TABLE; Schema: public; Owner: hutan_kita_user
--

CREATE TABLE public."GroupDemographics" (
    id integer NOT NULL,
    "institutionId" integer,
    "avgAge" numeric(4,1),
    "educationLevel" character varying(50),
    "avgFarmingExperience" integer,
    "hasSmartphoneAccess" boolean,
    "hasInternetAccess" boolean,
    "smartphonePercent" numeric(5,2),
    "yearRecorded" integer,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."GroupDemographics" OWNER TO hutan_kita_user;

--
-- Name: GroupDemographics_id_seq; Type: SEQUENCE; Schema: public; Owner: hutan_kita_user
--

CREATE SEQUENCE public."GroupDemographics_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."GroupDemographics_id_seq" OWNER TO hutan_kita_user;

--
-- Name: GroupDemographics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hutan_kita_user
--

ALTER SEQUENCE public."GroupDemographics_id_seq" OWNED BY public."GroupDemographics".id;


--
-- Name: InstitutionContacts; Type: TABLE; Schema: public; Owner: hutan_kita_user
--

CREATE TABLE public."InstitutionContacts" (
    id integer NOT NULL,
    "institutionId" integer,
    "contactType" character varying(20),
    "contactValue" character varying(100),
    "isPrimary" boolean DEFAULT false,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."InstitutionContacts" OWNER TO hutan_kita_user;

--
-- Name: InstitutionContacts_id_seq; Type: SEQUENCE; Schema: public; Owner: hutan_kita_user
--

CREATE SEQUENCE public."InstitutionContacts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."InstitutionContacts_id_seq" OWNER TO hutan_kita_user;

--
-- Name: InstitutionContacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hutan_kita_user
--

ALTER SEQUENCE public."InstitutionContacts_id_seq" OWNED BY public."InstitutionContacts".id;


--
-- Name: InstitutionMembers; Type: TABLE; Schema: public; Owner: hutan_kita_user
--

CREATE TABLE public."InstitutionMembers" (
    id integer NOT NULL,
    "institutionId" integer,
    "totalMembers" integer,
    "totalHouseholds" integer,
    "yearRecorded" integer,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."InstitutionMembers" OWNER TO hutan_kita_user;

--
-- Name: InstitutionMembers_id_seq; Type: SEQUENCE; Schema: public; Owner: hutan_kita_user
--

CREATE SEQUENCE public."InstitutionMembers_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."InstitutionMembers_id_seq" OWNER TO hutan_kita_user;

--
-- Name: InstitutionMembers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hutan_kita_user
--

ALTER SEQUENCE public."InstitutionMembers_id_seq" OWNED BY public."InstitutionMembers".id;


--
-- Name: InstitutionTypes; Type: TABLE; Schema: public; Owner: hutan_kita_user
--

CREATE TABLE public."InstitutionTypes" (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."InstitutionTypes" OWNER TO hutan_kita_user;

--
-- Name: InstitutionTypes_id_seq; Type: SEQUENCE; Schema: public; Owner: hutan_kita_user
--

CREATE SEQUENCE public."InstitutionTypes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."InstitutionTypes_id_seq" OWNER TO hutan_kita_user;

--
-- Name: InstitutionTypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hutan_kita_user
--

ALTER SEQUENCE public."InstitutionTypes_id_seq" OWNED BY public."InstitutionTypes".id;


--
-- Name: Institutions; Type: TABLE; Schema: public; Owner: hutan_kita_user
--

CREATE TABLE public."Institutions" (
    id integer NOT NULL,
    "institutionTypeId" integer,
    "shortName" character varying(100) NOT NULL,
    "fullName" character varying(200) NOT NULL,
    "chairmanName" character varying(150),
    "isActive" boolean DEFAULT true,
    "businessPlanStatus" character varying(20),
    "aepStatus" boolean DEFAULT false,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Institutions" OWNER TO hutan_kita_user;

--
-- Name: Institutions_id_seq; Type: SEQUENCE; Schema: public; Owner: hutan_kita_user
--

CREATE SEQUENCE public."Institutions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Institutions_id_seq" OWNER TO hutan_kita_user;

--
-- Name: Institutions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hutan_kita_user
--

ALTER SEQUENCE public."Institutions_id_seq" OWNED BY public."Institutions".id;


--
-- Name: LandCoverTypes; Type: TABLE; Schema: public; Owner: hutan_kita_user
--

CREATE TABLE public."LandCoverTypes" (
    id integer NOT NULL,
    code character varying(50) NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."LandCoverTypes" OWNER TO hutan_kita_user;

--
-- Name: LandCoverTypes_id_seq; Type: SEQUENCE; Schema: public; Owner: hutan_kita_user
--

CREATE SEQUENCE public."LandCoverTypes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."LandCoverTypes_id_seq" OWNER TO hutan_kita_user;

--
-- Name: LandCoverTypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hutan_kita_user
--

ALTER SEQUENCE public."LandCoverTypes_id_seq" OWNED BY public."LandCoverTypes".id;


--
-- Name: MarketData; Type: TABLE; Schema: public; Owner: hutan_kita_user
--

CREATE TABLE public."MarketData" (
    id integer NOT NULL,
    "commodityId" integer,
    "permitId" integer,
    "buyerId" integer,
    "localPrice" numeric(12,2),
    "nationalPrice" numeric(12,2),
    "priceUnit" character varying(50),
    "absorptionVolume" numeric(12,2),
    "absorptionUnit" character varying(50),
    "logisticCost" numeric(12,2),
    "hasExportPotential" boolean DEFAULT false,
    "hasRegularBuyer" boolean DEFAULT false,
    "yearRecorded" integer,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."MarketData" OWNER TO hutan_kita_user;

--
-- Name: MarketData_id_seq; Type: SEQUENCE; Schema: public; Owner: hutan_kita_user
--

CREATE SEQUENCE public."MarketData_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."MarketData_id_seq" OWNER TO hutan_kita_user;

--
-- Name: MarketData_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hutan_kita_user
--

ALTER SEQUENCE public."MarketData_id_seq" OWNED BY public."MarketData".id;


--
-- Name: MonitoringLogs; Type: TABLE; Schema: public; Owner: hutan_kita_user
--

CREATE TABLE public."MonitoringLogs" (
    id integer NOT NULL,
    "permitId" integer,
    "monitorType" character varying(100),
    "monitorDate" date,
    findings text,
    recommendations text,
    "officerName" character varying(200),
    photos jsonb,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."MonitoringLogs" OWNER TO hutan_kita_user;

--
-- Name: MonitoringLogs_id_seq; Type: SEQUENCE; Schema: public; Owner: hutan_kita_user
--

CREATE SEQUENCE public."MonitoringLogs_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."MonitoringLogs_id_seq" OWNER TO hutan_kita_user;

--
-- Name: MonitoringLogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hutan_kita_user
--

ALTER SEQUENCE public."MonitoringLogs_id_seq" OWNED BY public."MonitoringLogs".id;


--
-- Name: PSSchemes; Type: TABLE; Schema: public; Owner: hutan_kita_user
--

CREATE TABLE public."PSSchemes" (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."PSSchemes" OWNER TO hutan_kita_user;

--
-- Name: PSSchemes_id_seq; Type: SEQUENCE; Schema: public; Owner: hutan_kita_user
--

CREATE SEQUENCE public."PSSchemes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."PSSchemes_id_seq" OWNER TO hutan_kita_user;

--
-- Name: PSSchemes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hutan_kita_user
--

ALTER SEQUENCE public."PSSchemes_id_seq" OWNED BY public."PSSchemes".id;


--
-- Name: PermitCommodities; Type: TABLE; Schema: public; Owner: hutan_kita_user
--

CREATE TABLE public."PermitCommodities" (
    id integer NOT NULL,
    "permitId" integer,
    "commodityId" integer,
    "isPrimary" boolean DEFAULT false,
    "productionQty" numeric(12,2),
    "productionUnit" character varying(20),
    notes text,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."PermitCommodities" OWNER TO hutan_kita_user;

--
-- Name: PermitCommodities_id_seq; Type: SEQUENCE; Schema: public; Owner: hutan_kita_user
--

CREATE SEQUENCE public."PermitCommodities_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."PermitCommodities_id_seq" OWNER TO hutan_kita_user;

--
-- Name: PermitCommodities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hutan_kita_user
--

ALTER SEQUENCE public."PermitCommodities_id_seq" OWNED BY public."PermitCommodities".id;


--
-- Name: PermitForestStatuses; Type: TABLE; Schema: public; Owner: hutan_kita_user
--

CREATE TABLE public."PermitForestStatuses" (
    id integer NOT NULL,
    "permitId" integer,
    "statusId" integer,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."PermitForestStatuses" OWNER TO hutan_kita_user;

--
-- Name: PermitForestStatuses_id_seq; Type: SEQUENCE; Schema: public; Owner: hutan_kita_user
--

CREATE SEQUENCE public."PermitForestStatuses_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."PermitForestStatuses_id_seq" OWNER TO hutan_kita_user;

--
-- Name: PermitForestStatuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hutan_kita_user
--

ALTER SEQUENCE public."PermitForestStatuses_id_seq" OWNED BY public."PermitForestStatuses".id;


--
-- Name: PermitLandCovers; Type: TABLE; Schema: public; Owner: hutan_kita_user
--

CREATE TABLE public."PermitLandCovers" (
    id integer NOT NULL,
    "permitId" integer,
    "landCoverTypeId" integer,
    "coverPercentage" numeric(5,2),
    "areaHectares" numeric(12,2),
    "yearRecorded" integer,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."PermitLandCovers" OWNER TO hutan_kita_user;

--
-- Name: PermitLandCovers_id_seq; Type: SEQUENCE; Schema: public; Owner: hutan_kita_user
--

CREATE SEQUENCE public."PermitLandCovers_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."PermitLandCovers_id_seq" OWNER TO hutan_kita_user;

--
-- Name: PermitLandCovers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hutan_kita_user
--

ALTER SEQUENCE public."PermitLandCovers_id_seq" OWNED BY public."PermitLandCovers".id;


--
-- Name: PriorityScores; Type: TABLE; Schema: public; Owner: hutan_kita_user
--

CREATE TABLE public."PriorityScores" (
    id integer NOT NULL,
    "permitId" integer,
    "legalScore" numeric(3,2),
    "biophysicalScore" numeric(3,2),
    "commodityScore" numeric(3,2),
    "sdmScore" numeric(3,2),
    "marketScore" numeric(3,2),
    "environmentScore" numeric(3,2),
    "compositeScore" numeric(3,2),
    "priorityCategory" character varying(50),
    "lastCalculated" timestamp with time zone,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."PriorityScores" OWNER TO hutan_kita_user;

--
-- Name: PriorityScores_id_seq; Type: SEQUENCE; Schema: public; Owner: hutan_kita_user
--

CREATE SEQUENCE public."PriorityScores_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."PriorityScores_id_seq" OWNER TO hutan_kita_user;

--
-- Name: PriorityScores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hutan_kita_user
--

ALTER SEQUENCE public."PriorityScores_id_seq" OWNED BY public."PriorityScores".id;


--
-- Name: ProductionRecords; Type: TABLE; Schema: public; Owner: hutan_kita_user
--

CREATE TABLE public."ProductionRecords" (
    id integer NOT NULL,
    "permitId" integer,
    "commodityId" integer,
    year integer NOT NULL,
    month integer,
    "quantityRaw" numeric(12,2),
    "quantityProcessed" numeric(12,2),
    unit character varying(50),
    notes text,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."ProductionRecords" OWNER TO hutan_kita_user;

--
-- Name: ProductionRecords_id_seq; Type: SEQUENCE; Schema: public; Owner: hutan_kita_user
--

CREATE SEQUENCE public."ProductionRecords_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."ProductionRecords_id_seq" OWNER TO hutan_kita_user;

--
-- Name: ProductionRecords_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hutan_kita_user
--

ALTER SEQUENCE public."ProductionRecords_id_seq" OWNED BY public."ProductionRecords".id;


--
-- Name: ProtectedZones; Type: TABLE; Schema: public; Owner: hutan_kita_user
--

CREATE TABLE public."ProtectedZones" (
    id integer NOT NULL,
    name character varying(200),
    "zoneType" character varying(100),
    boundary public.geometry(Polygon,4326),
    "areaHectares" numeric(12,2),
    "legalBasis" text,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."ProtectedZones" OWNER TO hutan_kita_user;

--
-- Name: ProtectedZones_id_seq; Type: SEQUENCE; Schema: public; Owner: hutan_kita_user
--

CREATE SEQUENCE public."ProtectedZones_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."ProtectedZones_id_seq" OWNER TO hutan_kita_user;

--
-- Name: ProtectedZones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hutan_kita_user
--

ALTER SEQUENCE public."ProtectedZones_id_seq" OWNED BY public."ProtectedZones".id;


--
-- Name: Provinces; Type: TABLE; Schema: public; Owner: hutan_kita_user
--

CREATE TABLE public."Provinces" (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    code character varying(10),
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Provinces" OWNER TO hutan_kita_user;

--
-- Name: Provinces_id_seq; Type: SEQUENCE; Schema: public; Owner: hutan_kita_user
--

CREATE SEQUENCE public."Provinces_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Provinces_id_seq" OWNER TO hutan_kita_user;

--
-- Name: Provinces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hutan_kita_user
--

ALTER SEQUENCE public."Provinces_id_seq" OWNED BY public."Provinces".id;


--
-- Name: Regencies; Type: TABLE; Schema: public; Owner: hutan_kita_user
--

CREATE TABLE public."Regencies" (
    id integer NOT NULL,
    "provinceId" integer,
    name character varying(100) NOT NULL,
    type character varying(20),
    code character varying(10),
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Regencies" OWNER TO hutan_kita_user;

--
-- Name: Regencies_id_seq; Type: SEQUENCE; Schema: public; Owner: hutan_kita_user
--

CREATE SEQUENCE public."Regencies_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Regencies_id_seq" OWNER TO hutan_kita_user;

--
-- Name: Regencies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hutan_kita_user
--

ALTER SEQUENCE public."Regencies_id_seq" OWNED BY public."Regencies".id;


--
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: hutan_kita_user
--

CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);


ALTER TABLE public."SequelizeMeta" OWNER TO hutan_kita_user;

--
-- Name: SocialForestPermits; Type: TABLE; Schema: public; Owner: hutan_kita_user
--

CREATE TABLE public."SocialForestPermits" (
    id integer NOT NULL,
    "institutionId" integer,
    "villageId" integer,
    "schemeId" integer,
    location public.geometry(Point,4326),
    boundary public.geometry(Polygon,4326),
    "permitNumber" text,
    "permitYear" integer,
    "permitStatus" character varying(20) DEFAULT 'Izin'::character varying,
    "validFrom" date,
    "validUntil" date,
    "areaPermitted" numeric(12,2),
    "areaInProcess" numeric(12,2),
    "hasPhysicalDoc" boolean DEFAULT false,
    "hasPdfDoc" boolean DEFAULT false,
    "hasHandover" boolean DEFAULT false,
    "hasLandConflict" boolean DEFAULT false,
    "roadAccessType" character varying(50),
    "portAccess" boolean,
    "distanceToMarket" numeric(8,2),
    notes text,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."SocialForestPermits" OWNER TO hutan_kita_user;

--
-- Name: SocialForestPermits_id_seq; Type: SEQUENCE; Schema: public; Owner: hutan_kita_user
--

CREATE SEQUENCE public."SocialForestPermits_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."SocialForestPermits_id_seq" OWNER TO hutan_kita_user;

--
-- Name: SocialForestPermits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hutan_kita_user
--

ALTER SEQUENCE public."SocialForestPermits_id_seq" OWNED BY public."SocialForestPermits".id;


--
-- Name: SupplyChainNodes; Type: TABLE; Schema: public; Owner: hutan_kita_user
--

CREATE TABLE public."SupplyChainNodes" (
    id integer NOT NULL,
    "commodityId" integer,
    "nodeType" character varying(50),
    name character varying(200),
    location public.geometry(Point,4326),
    "orderInChain" integer,
    "marginPercent" numeric(5,2),
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."SupplyChainNodes" OWNER TO hutan_kita_user;

--
-- Name: SupplyChainNodes_id_seq; Type: SEQUENCE; Schema: public; Owner: hutan_kita_user
--

CREATE SEQUENCE public."SupplyChainNodes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."SupplyChainNodes_id_seq" OWNER TO hutan_kita_user;

--
-- Name: SupplyChainNodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hutan_kita_user
--

ALTER SEQUENCE public."SupplyChainNodes_id_seq" OWNED BY public."SupplyChainNodes".id;


--
-- Name: SystemConfig; Type: TABLE; Schema: public; Owner: hutan_kita_user
--

CREATE TABLE public."SystemConfig" (
    id integer NOT NULL,
    key character varying(100) NOT NULL,
    value jsonb,
    description text,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."SystemConfig" OWNER TO hutan_kita_user;

--
-- Name: SystemConfig_id_seq; Type: SEQUENCE; Schema: public; Owner: hutan_kita_user
--

CREATE SEQUENCE public."SystemConfig_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."SystemConfig_id_seq" OWNER TO hutan_kita_user;

--
-- Name: SystemConfig_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hutan_kita_user
--

ALTER SEQUENCE public."SystemConfig_id_seq" OWNED BY public."SystemConfig".id;


--
-- Name: Users; Type: TABLE; Schema: public; Owner: hutan_kita_user
--

CREATE TABLE public."Users" (
    id integer NOT NULL,
    email character varying(200) NOT NULL,
    "passwordHash" text NOT NULL,
    "fullName" character varying(150),
    role character varying(30) NOT NULL,
    phone character varying(20),
    "isActive" boolean DEFAULT true,
    "lastLoginAt" timestamp with time zone,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Users" OWNER TO hutan_kita_user;

--
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: hutan_kita_user
--

CREATE SEQUENCE public."Users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Users_id_seq" OWNER TO hutan_kita_user;

--
-- Name: Users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hutan_kita_user
--

ALTER SEQUENCE public."Users_id_seq" OWNED BY public."Users".id;


--
-- Name: Villages; Type: TABLE; Schema: public; Owner: hutan_kita_user
--

CREATE TABLE public."Villages" (
    id integer NOT NULL,
    "districtId" integer,
    name character varying(100) NOT NULL,
    code character varying(20),
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Villages" OWNER TO hutan_kita_user;

--
-- Name: Villages_id_seq; Type: SEQUENCE; Schema: public; Owner: hutan_kita_user
--

CREATE SEQUENCE public."Villages_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Villages_id_seq" OWNER TO hutan_kita_user;

--
-- Name: Villages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hutan_kita_user
--

ALTER SEQUENCE public."Villages_id_seq" OWNED BY public."Villages".id;


--
-- Name: BiophysicalProfiles id; Type: DEFAULT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."BiophysicalProfiles" ALTER COLUMN id SET DEFAULT nextval('public."BiophysicalProfiles_id_seq"'::regclass);


--
-- Name: BusinessReadiness id; Type: DEFAULT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."BusinessReadiness" ALTER COLUMN id SET DEFAULT nextval('public."BusinessReadiness_id_seq"'::regclass);


--
-- Name: Buyers id; Type: DEFAULT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."Buyers" ALTER COLUMN id SET DEFAULT nextval('public."Buyers_id_seq"'::regclass);


--
-- Name: CarryingCapacity id; Type: DEFAULT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."CarryingCapacity" ALTER COLUMN id SET DEFAULT nextval('public."CarryingCapacity_id_seq"'::regclass);


--
-- Name: Commodities id; Type: DEFAULT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."Commodities" ALTER COLUMN id SET DEFAULT nextval('public."Commodities_id_seq"'::regclass);


--
-- Name: CommoditySuitabilities id; Type: DEFAULT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."CommoditySuitabilities" ALTER COLUMN id SET DEFAULT nextval('public."CommoditySuitabilities_id_seq"'::regclass);


--
-- Name: DerivedProducts id; Type: DEFAULT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."DerivedProducts" ALTER COLUMN id SET DEFAULT nextval('public."DerivedProducts_id_seq"'::regclass);


--
-- Name: Districts id; Type: DEFAULT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."Districts" ALTER COLUMN id SET DEFAULT nextval('public."Districts_id_seq"'::regclass);


--
-- Name: EnvironmentalRisks id; Type: DEFAULT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."EnvironmentalRisks" ALTER COLUMN id SET DEFAULT nextval('public."EnvironmentalRisks_id_seq"'::regclass);


--
-- Name: ForestAreaStatuses id; Type: DEFAULT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."ForestAreaStatuses" ALTER COLUMN id SET DEFAULT nextval('public."ForestAreaStatuses_id_seq"'::regclass);


--
-- Name: GroupDemographics id; Type: DEFAULT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."GroupDemographics" ALTER COLUMN id SET DEFAULT nextval('public."GroupDemographics_id_seq"'::regclass);


--
-- Name: InstitutionContacts id; Type: DEFAULT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."InstitutionContacts" ALTER COLUMN id SET DEFAULT nextval('public."InstitutionContacts_id_seq"'::regclass);


--
-- Name: InstitutionMembers id; Type: DEFAULT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."InstitutionMembers" ALTER COLUMN id SET DEFAULT nextval('public."InstitutionMembers_id_seq"'::regclass);


--
-- Name: InstitutionTypes id; Type: DEFAULT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."InstitutionTypes" ALTER COLUMN id SET DEFAULT nextval('public."InstitutionTypes_id_seq"'::regclass);


--
-- Name: Institutions id; Type: DEFAULT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."Institutions" ALTER COLUMN id SET DEFAULT nextval('public."Institutions_id_seq"'::regclass);


--
-- Name: LandCoverTypes id; Type: DEFAULT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."LandCoverTypes" ALTER COLUMN id SET DEFAULT nextval('public."LandCoverTypes_id_seq"'::regclass);


--
-- Name: MarketData id; Type: DEFAULT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."MarketData" ALTER COLUMN id SET DEFAULT nextval('public."MarketData_id_seq"'::regclass);


--
-- Name: MonitoringLogs id; Type: DEFAULT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."MonitoringLogs" ALTER COLUMN id SET DEFAULT nextval('public."MonitoringLogs_id_seq"'::regclass);


--
-- Name: PSSchemes id; Type: DEFAULT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."PSSchemes" ALTER COLUMN id SET DEFAULT nextval('public."PSSchemes_id_seq"'::regclass);


--
-- Name: PermitCommodities id; Type: DEFAULT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."PermitCommodities" ALTER COLUMN id SET DEFAULT nextval('public."PermitCommodities_id_seq"'::regclass);


--
-- Name: PermitForestStatuses id; Type: DEFAULT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."PermitForestStatuses" ALTER COLUMN id SET DEFAULT nextval('public."PermitForestStatuses_id_seq"'::regclass);


--
-- Name: PermitLandCovers id; Type: DEFAULT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."PermitLandCovers" ALTER COLUMN id SET DEFAULT nextval('public."PermitLandCovers_id_seq"'::regclass);


--
-- Name: PriorityScores id; Type: DEFAULT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."PriorityScores" ALTER COLUMN id SET DEFAULT nextval('public."PriorityScores_id_seq"'::regclass);


--
-- Name: ProductionRecords id; Type: DEFAULT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."ProductionRecords" ALTER COLUMN id SET DEFAULT nextval('public."ProductionRecords_id_seq"'::regclass);


--
-- Name: ProtectedZones id; Type: DEFAULT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."ProtectedZones" ALTER COLUMN id SET DEFAULT nextval('public."ProtectedZones_id_seq"'::regclass);


--
-- Name: Provinces id; Type: DEFAULT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."Provinces" ALTER COLUMN id SET DEFAULT nextval('public."Provinces_id_seq"'::regclass);


--
-- Name: Regencies id; Type: DEFAULT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."Regencies" ALTER COLUMN id SET DEFAULT nextval('public."Regencies_id_seq"'::regclass);


--
-- Name: SocialForestPermits id; Type: DEFAULT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."SocialForestPermits" ALTER COLUMN id SET DEFAULT nextval('public."SocialForestPermits_id_seq"'::regclass);


--
-- Name: SupplyChainNodes id; Type: DEFAULT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."SupplyChainNodes" ALTER COLUMN id SET DEFAULT nextval('public."SupplyChainNodes_id_seq"'::regclass);


--
-- Name: SystemConfig id; Type: DEFAULT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."SystemConfig" ALTER COLUMN id SET DEFAULT nextval('public."SystemConfig_id_seq"'::regclass);


--
-- Name: Users id; Type: DEFAULT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."Users" ALTER COLUMN id SET DEFAULT nextval('public."Users_id_seq"'::regclass);


--
-- Name: Villages id; Type: DEFAULT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."Villages" ALTER COLUMN id SET DEFAULT nextval('public."Villages_id_seq"'::regclass);


--
-- Data for Name: BiophysicalProfiles; Type: TABLE DATA; Schema: public; Owner: hutan_kita_user
--

COPY public."BiophysicalProfiles" (id, "permitId", "rainfallMm", "rainfallCategory", "elevationM", "soilType", "slopePercent", "slopeCategory", notes, "yearRecorded", "createdAt", "updatedAt") FROM stdin;
1	1	2183.67	Tinggi	630.70	Latosol	0.88	Agak Curam	\N	2024	2026-02-16 02:40:43.598+07	2026-02-16 02:40:43.598+07
2	2	2457.80	Tinggi	214.92	Latosol	27.18	Agak Curam	\N	2024	2026-02-16 02:40:43.626+07	2026-02-16 02:40:43.626+07
3	3	2571.74	Tinggi	437.50	Latosol	31.04	Agak Curam	\N	2024	2026-02-16 02:40:43.635+07	2026-02-16 02:40:43.635+07
4	4	2622.75	Tinggi	528.16	Andosol	1.28	Agak Curam	\N	2024	2026-02-16 02:40:43.645+07	2026-02-16 02:40:43.645+07
5	5	2725.81	Tinggi	471.68	Andosol	24.14	Agak Curam	\N	2024	2026-02-16 02:40:43.653+07	2026-02-16 02:40:43.653+07
6	6	2627.05	Tinggi	195.60	Podsolik	37.03	Agak Curam	\N	2024	2026-02-16 02:40:43.661+07	2026-02-16 02:40:43.661+07
7	7	2291.74	Tinggi	709.01	Andosol	30.64	Agak Curam	\N	2024	2026-02-16 02:40:43.67+07	2026-02-16 02:40:43.67+07
8	8	2483.14	Tinggi	683.50	Podsolik	14.22	Agak Curam	\N	2024	2026-02-16 02:40:43.678+07	2026-02-16 02:40:43.678+07
9	9	2524.98	Tinggi	340.42	Podsolik	19.25	Agak Curam	\N	2024	2026-02-16 02:40:43.685+07	2026-02-16 02:40:43.685+07
10	10	2831.13	Tinggi	740.48	Andosol	9.08	Agak Curam	\N	2024	2026-02-16 02:40:43.692+07	2026-02-16 02:40:43.692+07
11	11	2186.20	Tinggi	350.81	Podsolik	28.65	Agak Curam	\N	2024	2026-02-16 02:40:43.698+07	2026-02-16 02:40:43.698+07
12	12	2657.73	Tinggi	739.02	Latosol	15.20	Agak Curam	\N	2024	2026-02-16 02:40:43.706+07	2026-02-16 02:40:43.706+07
13	13	2459.21	Tinggi	607.05	Andosol	31.11	Agak Curam	\N	2024	2026-02-16 02:40:43.713+07	2026-02-16 02:40:43.713+07
14	14	2806.61	Tinggi	834.51	Latosol	38.72	Agak Curam	\N	2024	2026-02-16 02:40:43.72+07	2026-02-16 02:40:43.72+07
15	15	2798.14	Tinggi	467.47	Podsolik	21.46	Agak Curam	\N	2024	2026-02-16 02:40:43.727+07	2026-02-16 02:40:43.727+07
16	16	2574.44	Tinggi	428.60	Latosol	28.76	Agak Curam	\N	2024	2026-02-16 02:40:43.733+07	2026-02-16 02:40:43.733+07
17	17	2044.23	Tinggi	497.04	Latosol	4.25	Agak Curam	\N	2024	2026-02-16 02:40:43.741+07	2026-02-16 02:40:43.741+07
18	18	2459.26	Tinggi	823.10	Andosol	11.98	Agak Curam	\N	2024	2026-02-16 02:40:43.747+07	2026-02-16 02:40:43.747+07
19	19	2416.92	Tinggi	884.62	Podsolik	5.73	Agak Curam	\N	2024	2026-02-16 02:40:43.754+07	2026-02-16 02:40:43.754+07
20	20	2118.85	Tinggi	685.87	Podsolik	12.45	Agak Curam	\N	2024	2026-02-16 02:40:43.76+07	2026-02-16 02:40:43.76+07
21	21	2627.29	Tinggi	886.31	Aluvial	8.35	Agak Curam	\N	2024	2026-02-16 02:40:43.765+07	2026-02-16 02:40:43.765+07
22	22	2345.04	Tinggi	159.47	Andosol	38.27	Agak Curam	\N	2024	2026-02-16 02:40:43.772+07	2026-02-16 02:40:43.772+07
23	23	2939.39	Tinggi	721.38	Latosol	36.86	Agak Curam	\N	2024	2026-02-16 02:40:43.779+07	2026-02-16 02:40:43.779+07
24	24	2460.88	Tinggi	106.51	Andosol	18.43	Agak Curam	\N	2024	2026-02-16 02:40:43.785+07	2026-02-16 02:40:43.785+07
25	25	2989.23	Tinggi	836.95	Latosol	34.21	Agak Curam	\N	2024	2026-02-16 02:40:43.794+07	2026-02-16 02:40:43.794+07
26	26	2889.78	Tinggi	181.70	Aluvial	36.52	Agak Curam	\N	2024	2026-02-16 02:40:43.8+07	2026-02-16 02:40:43.8+07
27	27	2376.54	Tinggi	438.43	Aluvial	4.72	Agak Curam	\N	2024	2026-02-16 02:40:43.807+07	2026-02-16 02:40:43.807+07
28	28	2357.96	Tinggi	744.21	Latosol	24.19	Agak Curam	\N	2024	2026-02-16 02:40:43.814+07	2026-02-16 02:40:43.814+07
29	29	2020.57	Tinggi	143.13	Podsolik	9.78	Agak Curam	\N	2024	2026-02-16 02:40:43.822+07	2026-02-16 02:40:43.822+07
30	30	2202.85	Tinggi	354.55	Andosol	0.04	Agak Curam	\N	2024	2026-02-16 02:40:43.828+07	2026-02-16 02:40:43.828+07
31	31	2408.28	Tinggi	417.66	Aluvial	8.38	Agak Curam	\N	2024	2026-02-16 02:40:43.835+07	2026-02-16 02:40:43.835+07
32	32	2341.10	Tinggi	107.05	Aluvial	34.39	Agak Curam	\N	2024	2026-02-16 02:40:43.843+07	2026-02-16 02:40:43.843+07
33	33	2400.68	Tinggi	554.82	Latosol	34.42	Agak Curam	\N	2024	2026-02-16 02:40:43.849+07	2026-02-16 02:40:43.849+07
34	34	2455.96	Tinggi	399.24	Andosol	15.79	Agak Curam	\N	2024	2026-02-16 02:40:43.856+07	2026-02-16 02:40:43.856+07
35	35	2904.04	Tinggi	874.32	Podsolik	24.04	Agak Curam	\N	2024	2026-02-16 02:40:43.863+07	2026-02-16 02:40:43.863+07
36	36	2153.06	Tinggi	426.90	Podsolik	4.55	Agak Curam	\N	2024	2026-02-16 02:40:43.87+07	2026-02-16 02:40:43.87+07
37	37	2459.34	Tinggi	306.09	Andosol	35.68	Agak Curam	\N	2024	2026-02-16 02:40:43.876+07	2026-02-16 02:40:43.876+07
38	38	2459.82	Tinggi	863.10	Latosol	35.36	Agak Curam	\N	2024	2026-02-16 02:40:43.883+07	2026-02-16 02:40:43.883+07
39	39	2873.93	Tinggi	523.07	Andosol	24.82	Agak Curam	\N	2024	2026-02-16 02:40:43.89+07	2026-02-16 02:40:43.89+07
40	40	2021.73	Tinggi	265.78	Podsolik	39.31	Agak Curam	\N	2024	2026-02-16 02:40:43.896+07	2026-02-16 02:40:43.896+07
41	41	2483.43	Tinggi	821.96	Latosol	24.47	Agak Curam	\N	2024	2026-02-16 02:40:43.903+07	2026-02-16 02:40:43.903+07
42	42	2673.14	Tinggi	526.98	Podsolik	29.81	Agak Curam	\N	2024	2026-02-16 02:40:43.909+07	2026-02-16 02:40:43.909+07
43	43	2386.57	Tinggi	169.50	Latosol	31.39	Agak Curam	\N	2024	2026-02-16 02:40:43.915+07	2026-02-16 02:40:43.915+07
44	44	2907.36	Tinggi	506.49	Aluvial	39.35	Agak Curam	\N	2024	2026-02-16 02:40:43.922+07	2026-02-16 02:40:43.922+07
45	45	2456.33	Tinggi	249.51	Podsolik	13.42	Agak Curam	\N	2024	2026-02-16 02:40:43.929+07	2026-02-16 02:40:43.929+07
46	46	2216.85	Tinggi	539.46	Andosol	13.09	Agak Curam	\N	2024	2026-02-16 02:40:43.936+07	2026-02-16 02:40:43.936+07
47	47	2889.93	Tinggi	466.54	Latosol	9.10	Agak Curam	\N	2024	2026-02-16 02:40:43.941+07	2026-02-16 02:40:43.941+07
48	48	2266.25	Tinggi	422.78	Andosol	15.06	Agak Curam	\N	2024	2026-02-16 02:40:43.948+07	2026-02-16 02:40:43.948+07
49	49	2043.76	Tinggi	554.99	Aluvial	12.03	Agak Curam	\N	2024	2026-02-16 02:40:43.956+07	2026-02-16 02:40:43.956+07
50	50	2645.91	Tinggi	461.53	Podsolik	15.56	Agak Curam	\N	2024	2026-02-16 02:40:43.961+07	2026-02-16 02:40:43.961+07
\.


--
-- Data for Name: BusinessReadiness; Type: TABLE DATA; Schema: public; Owner: hutan_kita_user
--

COPY public."BusinessReadiness" (id, "institutionId", "hasNIB", "hasBankAccount", "hasBookkeeping", "hasKURAccess", "kurAmount", "kurBank", "readinessScore", "readinessLevel", "yearRecorded", "createdAt", "updatedAt") FROM stdin;
1	1	f	t	t	f	\N	\N	0.90	Maju	2024	2026-02-16 02:40:43.615+07	2026-02-16 02:40:43.615+07
2	2	f	t	f	f	\N	\N	0.09	Maju	2024	2026-02-16 02:40:43.631+07	2026-02-16 02:40:43.631+07
3	3	f	t	f	t	\N	\N	0.09	Pemula	2024	2026-02-16 02:40:43.64+07	2026-02-16 02:40:43.64+07
4	4	f	f	f	t	\N	\N	0.39	Berkembang	2024	2026-02-16 02:40:43.648+07	2026-02-16 02:40:43.648+07
5	5	t	f	t	f	\N	\N	0.01	Pemula	2024	2026-02-16 02:40:43.657+07	2026-02-16 02:40:43.657+07
6	6	f	t	f	t	\N	\N	0.09	Maju	2024	2026-02-16 02:40:43.665+07	2026-02-16 02:40:43.665+07
7	7	t	t	f	f	\N	\N	0.06	Pemula	2024	2026-02-16 02:40:43.675+07	2026-02-16 02:40:43.675+07
8	8	f	f	f	f	\N	\N	0.49	Maju	2024	2026-02-16 02:40:43.681+07	2026-02-16 02:40:43.681+07
9	9	f	t	f	f	\N	\N	0.36	Maju	2024	2026-02-16 02:40:43.689+07	2026-02-16 02:40:43.689+07
10	10	t	f	f	f	\N	\N	0.15	Maju	2024	2026-02-16 02:40:43.695+07	2026-02-16 02:40:43.695+07
11	11	f	f	f	f	\N	\N	0.58	Berkembang	2024	2026-02-16 02:40:43.703+07	2026-02-16 02:40:43.703+07
12	12	t	t	f	f	\N	\N	0.34	Maju	2024	2026-02-16 02:40:43.709+07	2026-02-16 02:40:43.709+07
13	13	t	t	f	t	\N	\N	0.85	Berkembang	2024	2026-02-16 02:40:43.716+07	2026-02-16 02:40:43.716+07
14	14	f	f	f	f	\N	\N	0.02	Pemula	2024	2026-02-16 02:40:43.724+07	2026-02-16 02:40:43.724+07
15	15	t	t	t	f	\N	\N	0.54	Pemula	2024	2026-02-16 02:40:43.73+07	2026-02-16 02:40:43.73+07
16	16	f	f	f	f	\N	\N	0.78	Berkembang	2024	2026-02-16 02:40:43.739+07	2026-02-16 02:40:43.739+07
17	17	f	f	f	f	\N	\N	1.00	Berkembang	2024	2026-02-16 02:40:43.744+07	2026-02-16 02:40:43.744+07
18	18	t	f	f	t	\N	\N	0.44	Berkembang	2024	2026-02-16 02:40:43.751+07	2026-02-16 02:40:43.751+07
19	19	t	t	f	f	\N	\N	0.27	Pemula	2024	2026-02-16 02:40:43.758+07	2026-02-16 02:40:43.758+07
20	20	t	f	f	f	\N	\N	0.75	Pemula	2024	2026-02-16 02:40:43.763+07	2026-02-16 02:40:43.763+07
21	21	f	t	t	f	\N	\N	0.37	Maju	2024	2026-02-16 02:40:43.768+07	2026-02-16 02:40:43.768+07
22	22	t	t	f	f	\N	\N	0.81	Pemula	2024	2026-02-16 02:40:43.775+07	2026-02-16 02:40:43.775+07
23	23	t	t	f	f	\N	\N	0.98	Maju	2024	2026-02-16 02:40:43.782+07	2026-02-16 02:40:43.782+07
24	24	f	t	f	f	\N	\N	0.22	Berkembang	2024	2026-02-16 02:40:43.791+07	2026-02-16 02:40:43.791+07
25	25	t	f	f	f	\N	\N	0.87	Maju	2024	2026-02-16 02:40:43.797+07	2026-02-16 02:40:43.797+07
26	26	f	t	t	f	\N	\N	0.20	Berkembang	2024	2026-02-16 02:40:43.804+07	2026-02-16 02:40:43.804+07
27	27	t	t	t	t	\N	\N	0.52	Maju	2024	2026-02-16 02:40:43.811+07	2026-02-16 02:40:43.811+07
28	28	t	t	f	f	\N	\N	0.45	Berkembang	2024	2026-02-16 02:40:43.818+07	2026-02-16 02:40:43.818+07
29	29	t	f	f	f	\N	\N	0.44	Maju	2024	2026-02-16 02:40:43.825+07	2026-02-16 02:40:43.825+07
30	30	t	t	t	f	\N	\N	0.85	Maju	2024	2026-02-16 02:40:43.831+07	2026-02-16 02:40:43.831+07
31	31	t	f	f	f	\N	\N	0.38	Berkembang	2024	2026-02-16 02:40:43.84+07	2026-02-16 02:40:43.84+07
32	32	t	t	f	f	\N	\N	0.33	Berkembang	2024	2026-02-16 02:40:43.846+07	2026-02-16 02:40:43.846+07
33	33	f	f	f	f	\N	\N	0.38	Maju	2024	2026-02-16 02:40:43.853+07	2026-02-16 02:40:43.853+07
34	34	t	t	t	f	\N	\N	0.65	Pemula	2024	2026-02-16 02:40:43.86+07	2026-02-16 02:40:43.86+07
35	35	f	f	f	f	\N	\N	0.54	Maju	2024	2026-02-16 02:40:43.867+07	2026-02-16 02:40:43.867+07
36	36	t	f	f	f	\N	\N	0.40	Berkembang	2024	2026-02-16 02:40:43.874+07	2026-02-16 02:40:43.874+07
37	37	f	t	f	f	\N	\N	0.19	Berkembang	2024	2026-02-16 02:40:43.88+07	2026-02-16 02:40:43.88+07
38	38	t	f	f	f	\N	\N	0.33	Pemula	2024	2026-02-16 02:40:43.888+07	2026-02-16 02:40:43.888+07
39	39	f	t	t	f	\N	\N	0.91	Berkembang	2024	2026-02-16 02:40:43.893+07	2026-02-16 02:40:43.893+07
40	40	t	f	f	f	\N	\N	0.22	Maju	2024	2026-02-16 02:40:43.899+07	2026-02-16 02:40:43.899+07
41	41	t	t	f	f	\N	\N	0.07	Pemula	2024	2026-02-16 02:40:43.907+07	2026-02-16 02:40:43.907+07
42	42	t	f	f	f	\N	\N	0.65	Maju	2024	2026-02-16 02:40:43.913+07	2026-02-16 02:40:43.913+07
43	43	f	f	f	f	\N	\N	0.19	Berkembang	2024	2026-02-16 02:40:43.919+07	2026-02-16 02:40:43.919+07
44	44	f	t	f	f	\N	\N	0.19	Pemula	2024	2026-02-16 02:40:43.926+07	2026-02-16 02:40:43.926+07
45	45	f	t	f	f	\N	\N	0.11	Pemula	2024	2026-02-16 02:40:43.932+07	2026-02-16 02:40:43.932+07
46	46	f	f	t	f	\N	\N	0.10	Pemula	2024	2026-02-16 02:40:43.939+07	2026-02-16 02:40:43.939+07
47	47	f	f	f	f	\N	\N	0.47	Berkembang	2024	2026-02-16 02:40:43.945+07	2026-02-16 02:40:43.945+07
48	48	f	t	t	f	\N	\N	0.20	Pemula	2024	2026-02-16 02:40:43.952+07	2026-02-16 02:40:43.952+07
49	49	t	t	f	f	\N	\N	0.42	Berkembang	2024	2026-02-16 02:40:43.959+07	2026-02-16 02:40:43.959+07
50	50	t	t	f	t	\N	\N	0.11	Maju	2024	2026-02-16 02:40:43.965+07	2026-02-16 02:40:43.965+07
\.


--
-- Data for Name: Buyers; Type: TABLE DATA; Schema: public; Owner: hutan_kita_user
--

COPY public."Buyers" (id, name, "buyerType", "contactPerson", phone, email, address, location, "isActive", "createdAt", "updatedAt") FROM stdin;
1	PT. Indofood Sukses Makmur	\N	\N	021-1234567	\N	\N	0101000020E6100000B81E85EB51D85F409A9999999999E93F	t	2026-02-16 02:40:43.498+07	2026-02-16 02:40:43.498+07
2	UD. Hasil Bumi Malut	\N	\N	0812-3456-7890	\N	\N	0101000020E61000000000000000E05F40666666666666E63F	t	2026-02-16 02:40:43.581+07	2026-02-16 02:40:43.581+07
3	Koperasi Unit Desa Sejahtera	\N	\N	0813-9876-5432	\N	\N	0101000020E61000009A99999999D95F40CDCCCCCCCCCCEC3F	t	2026-02-16 02:40:43.584+07	2026-02-16 02:40:43.584+07
4	CV. Aroma Rempah Nusantara	\N	\N	0811-2233-4455	\N	\N	0101000020E61000006666666666D65F40333333333333EB3F	t	2026-02-16 02:40:43.588+07	2026-02-16 02:40:43.588+07
5	Pasar Lokal Ternate	\N	\N	-	\N	\N	0101000020E6100000B81E85EB51D85F4048E17A14AE47E93F	t	2026-02-16 02:40:43.591+07	2026-02-16 02:40:43.591+07
\.


--
-- Data for Name: CarryingCapacity; Type: TABLE DATA; Schema: public; Owner: hutan_kita_user
--

COPY public."CarryingCapacity" (id, "permitId", "capacityScore", "capacityLevel", "overExploitationRisk", "climateVulnerability", "assessmentDate", "createdAt", "updatedAt") FROM stdin;
1	1	0.64	Kritis	f	\N	2026-02-16	2026-02-16 02:40:43.619+07	2026-02-16 02:40:43.619+07
2	2	0.89	Waspada	f	\N	2026-02-16	2026-02-16 02:40:43.633+07	2026-02-16 02:40:43.633+07
3	3	0.81	Aman	f	\N	2026-02-16	2026-02-16 02:40:43.641+07	2026-02-16 02:40:43.641+07
4	4	0.38	Kritis	t	\N	2026-02-16	2026-02-16 02:40:43.65+07	2026-02-16 02:40:43.65+07
5	5	0.69	Kritis	t	\N	2026-02-16	2026-02-16 02:40:43.659+07	2026-02-16 02:40:43.659+07
6	6	0.91	Aman	t	\N	2026-02-16	2026-02-16 02:40:43.667+07	2026-02-16 02:40:43.667+07
7	7	0.86	Kritis	f	\N	2026-02-16	2026-02-16 02:40:43.676+07	2026-02-16 02:40:43.676+07
8	8	0.54	Waspada	f	\N	2026-02-16	2026-02-16 02:40:43.683+07	2026-02-16 02:40:43.683+07
9	9	0.66	Waspada	f	\N	2026-02-16	2026-02-16 02:40:43.691+07	2026-02-16 02:40:43.691+07
10	10	0.11	Waspada	t	\N	2026-02-16	2026-02-16 02:40:43.697+07	2026-02-16 02:40:43.697+07
11	11	0.61	Aman	f	\N	2026-02-16	2026-02-16 02:40:43.705+07	2026-02-16 02:40:43.705+07
12	12	0.25	Aman	t	\N	2026-02-16	2026-02-16 02:40:43.711+07	2026-02-16 02:40:43.711+07
13	13	0.14	Aman	f	\N	2026-02-16	2026-02-16 02:40:43.718+07	2026-02-16 02:40:43.718+07
14	14	0.38	Aman	t	\N	2026-02-16	2026-02-16 02:40:43.725+07	2026-02-16 02:40:43.725+07
15	15	0.65	Waspada	f	\N	2026-02-16	2026-02-16 02:40:43.731+07	2026-02-16 02:40:43.731+07
16	16	0.51	Kritis	f	\N	2026-02-16	2026-02-16 02:40:43.74+07	2026-02-16 02:40:43.74+07
17	17	0.27	Aman	f	\N	2026-02-16	2026-02-16 02:40:43.745+07	2026-02-16 02:40:43.745+07
18	18	0.49	Kritis	f	\N	2026-02-16	2026-02-16 02:40:43.752+07	2026-02-16 02:40:43.752+07
19	19	0.42	Waspada	f	\N	2026-02-16	2026-02-16 02:40:43.758+07	2026-02-16 02:40:43.758+07
20	20	0.41	Kritis	f	\N	2026-02-16	2026-02-16 02:40:43.764+07	2026-02-16 02:40:43.764+07
21	21	0.17	Waspada	f	\N	2026-02-16	2026-02-16 02:40:43.771+07	2026-02-16 02:40:43.771+07
22	22	0.66	Waspada	f	\N	2026-02-16	2026-02-16 02:40:43.776+07	2026-02-16 02:40:43.776+07
23	23	0.46	Waspada	f	\N	2026-02-16	2026-02-16 02:40:43.783+07	2026-02-16 02:40:43.783+07
24	24	0.77	Aman	t	\N	2026-02-16	2026-02-16 02:40:43.792+07	2026-02-16 02:40:43.792+07
25	25	0.50	Kritis	f	\N	2026-02-16	2026-02-16 02:40:43.799+07	2026-02-16 02:40:43.799+07
26	26	0.12	Aman	t	\N	2026-02-16	2026-02-16 02:40:43.806+07	2026-02-16 02:40:43.806+07
27	27	0.90	Kritis	f	\N	2026-02-16	2026-02-16 02:40:43.812+07	2026-02-16 02:40:43.812+07
28	28	0.39	Kritis	f	\N	2026-02-16	2026-02-16 02:40:43.82+07	2026-02-16 02:40:43.82+07
29	29	0.95	Aman	f	\N	2026-02-16	2026-02-16 02:40:43.827+07	2026-02-16 02:40:43.827+07
30	30	0.22	Aman	f	\N	2026-02-16	2026-02-16 02:40:43.833+07	2026-02-16 02:40:43.833+07
31	31	0.77	Aman	t	\N	2026-02-16	2026-02-16 02:40:43.842+07	2026-02-16 02:40:43.842+07
32	32	0.01	Waspada	f	\N	2026-02-16	2026-02-16 02:40:43.847+07	2026-02-16 02:40:43.847+07
33	33	0.37	Waspada	t	\N	2026-02-16	2026-02-16 02:40:43.855+07	2026-02-16 02:40:43.855+07
34	34	0.81	Kritis	f	\N	2026-02-16	2026-02-16 02:40:43.862+07	2026-02-16 02:40:43.862+07
35	35	0.74	Waspada	f	\N	2026-02-16	2026-02-16 02:40:43.868+07	2026-02-16 02:40:43.868+07
36	36	0.63	Kritis	t	\N	2026-02-16	2026-02-16 02:40:43.875+07	2026-02-16 02:40:43.875+07
37	37	0.87	Kritis	f	\N	2026-02-16	2026-02-16 02:40:43.882+07	2026-02-16 02:40:43.882+07
38	38	0.62	Kritis	f	\N	2026-02-16	2026-02-16 02:40:43.889+07	2026-02-16 02:40:43.889+07
39	39	0.30	Aman	f	\N	2026-02-16	2026-02-16 02:40:43.894+07	2026-02-16 02:40:43.894+07
40	40	0.91	Kritis	f	\N	2026-02-16	2026-02-16 02:40:43.901+07	2026-02-16 02:40:43.901+07
41	41	0.91	Aman	t	\N	2026-02-16	2026-02-16 02:40:43.908+07	2026-02-16 02:40:43.908+07
42	42	0.69	Waspada	t	\N	2026-02-16	2026-02-16 02:40:43.914+07	2026-02-16 02:40:43.914+07
43	43	0.45	Waspada	t	\N	2026-02-16	2026-02-16 02:40:43.921+07	2026-02-16 02:40:43.921+07
44	44	0.16	Aman	f	\N	2026-02-16	2026-02-16 02:40:43.927+07	2026-02-16 02:40:43.927+07
45	45	0.25	Waspada	f	\N	2026-02-16	2026-02-16 02:40:43.934+07	2026-02-16 02:40:43.934+07
46	46	0.61	Aman	f	\N	2026-02-16	2026-02-16 02:40:43.94+07	2026-02-16 02:40:43.94+07
47	47	0.65	Aman	t	\N	2026-02-16	2026-02-16 02:40:43.946+07	2026-02-16 02:40:43.946+07
48	48	0.39	Aman	f	\N	2026-02-16	2026-02-16 02:40:43.953+07	2026-02-16 02:40:43.953+07
49	49	0.29	Waspada	f	\N	2026-02-16	2026-02-16 02:40:43.96+07	2026-02-16 02:40:43.96+07
50	50	0.23	Kritis	f	\N	2026-02-16	2026-02-16 02:40:43.974+07	2026-02-16 02:40:43.974+07
\.


--
-- Data for Name: Commodities; Type: TABLE DATA; Schema: public; Owner: hutan_kita_user
--

COPY public."Commodities" (id, name, category, "iconUrl", description, "createdAt", "updatedAt") FROM stdin;
1	21	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
2	Pala	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
3	Cengkeh	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
4	Sukun	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
5	Bambu	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
6	Kelapa	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
7	Pemanfaatan Mata Air	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
8	Rotan	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
9	Getah Damar	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
10	Ekowisata	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
11	Durian	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
12	Rambutan	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
13	Kayu Manis	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
14	Langsat	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
15	Kakao	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
16	Ekowisara	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
17	Jasa Lingkungan	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
18	Manggis	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
19	Alpukat	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
20	Damar	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
21	Sengon	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
22	Matoa	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
23	Gaharu	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
24	Aren	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
25	Ekowisata Panorama Alam	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
26	Jamur Tiram	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
27	Lebah Madu	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
28	Kopi	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
29	Singkong	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
30	Jagung	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
31	Sereh Merah	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
32	Jahe Merah	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
33	Ekowisata Pendakian Gunung dan Panorama Alam	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
34	Jati	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
35	Ekowisata Air Terjun	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
36	Nanas	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
37	Jamur	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
38	Lebah	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
39	Ekowisata Lembah	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
40	Merbau	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
41	Cempaka	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
42	Nyatoh	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
43	Samama	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
44	Binuang	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
45	Gosale	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
46	Jabon	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
47	Kayu Besi	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
48	Hate Besi	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
49	Kerikis	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
50	Bintanggur	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
51	Ketapang	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
52	madu hutan	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
53	jambu lan (Duwet)	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
54	Pisang	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
55	Sagu	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
56	Kenanga	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
57	Kayu Bugis	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
58	Meranti	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
59	Kayu Merah	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
60	Kenari	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
61	Buah Rao	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
62	Enau	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
63	Gofasa	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
64	Linggua	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
65	ubi kayu	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
66	gufasa	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
67	Jabon Merah	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
68	Sengon Laut	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
69	Trembesi	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
70	Rambutan dan Cengkeh	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
71	Palaka	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
72	kelapa dan cengkeh	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
73	Coklat	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
74	Mangrove	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
75	Mersawa	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
76	Bintangur	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
77	Madu	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
78	Ketela	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
79	Ubi Jalar	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
80	Udang	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
81	Kepiting	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
82	Pohon Buro-buro	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
83	Cokelat	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
84	Mangga	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
85	Nangka	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
86	Sirsak	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
87	Bambu dan tanaman semusim	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
88	Kenari dan tanaman semusim	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
89	Vanili	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
90	Kemiri	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
91	Kepiting Bakau	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
92	Anggrek	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
93	Damar. Cengkeh	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
94	Duku	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
95	Jambu Mete	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
96	Cengkeh. Rotan	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
97	dan Umbi-Umbian	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
98	Kayu Lasi	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
99	Jambu Mente	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
100	Mannga	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
101	Balsa	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
102	Ekowisata Mangrove	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
103	Madu Trigona	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
104	Ekowisata Gunung	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
105	Meranti Merah	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
106	Meranti Putih	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
107	Nilam	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
108	Sukun Hutan	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
109	Kenari Hutan	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
110	Kayu Putih	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
111	Ekowisata Danau Morodai	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
112	Ekowisata Danau Gosora	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
113	cempedak	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
114	Jahe	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
115	Kacang Tanah	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
116	Rambutan Binjai	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
117	Tomat	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
118	Salak	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
119	Padi Ladang	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
120	ekwisata terumbu karang	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
121	budidaya rumout laut	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
122	budidaya kepiting	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
123	budidaya kerang-kerangan	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
124	budidaya ikan hias	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
125	jasling berupa pemenuhan kebutuhan air bersih	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
126	Ubi-Ubian	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
127	rao	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
128	jasling berupa air bersih	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
129	Kelapa dan Cokelat	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
130	Cemgleh	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
131	Rica Merah	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
132	tanaman semusim	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
133	langsa	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
134	Daun Bobo	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
135	Padi sawah	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
136	enau dan bambu	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
137	Kayu Tafiri	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
138	Besi	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
139	Gusale	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
140	tofiri	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
141	60	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
142	Coklat dan manggrov	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
143	Binuang.Cempaka	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
144	Kopra	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
\.


--
-- Data for Name: CommoditySuitabilities; Type: TABLE DATA; Schema: public; Owner: hutan_kita_user
--

COPY public."CommoditySuitabilities" (id, "permitId", "commodityId", "suitabilityScore", "suitabilityLevel", notes, "createdAt", "updatedAt") FROM stdin;
1	1	13	0.75	Sangat Cocok	\N	2026-02-16 02:40:43.609+07	2026-02-16 02:40:43.609+07
2	2	46	0.79	Sangat Cocok	\N	2026-02-16 02:40:43.63+07	2026-02-16 02:40:43.63+07
3	3	9	0.80	Sangat Cocok	\N	2026-02-16 02:40:43.638+07	2026-02-16 02:40:43.638+07
4	4	116	0.94	Sangat Cocok	\N	2026-02-16 02:40:43.647+07	2026-02-16 02:40:43.647+07
5	5	112	0.84	Sangat Cocok	\N	2026-02-16 02:40:43.656+07	2026-02-16 02:40:43.656+07
6	6	113	0.76	Sangat Cocok	\N	2026-02-16 02:40:43.663+07	2026-02-16 02:40:43.663+07
7	7	127	0.94	Sangat Cocok	\N	2026-02-16 02:40:43.673+07	2026-02-16 02:40:43.673+07
8	8	67	0.96	Sangat Cocok	\N	2026-02-16 02:40:43.68+07	2026-02-16 02:40:43.68+07
9	9	15	0.91	Sangat Cocok	\N	2026-02-16 02:40:43.688+07	2026-02-16 02:40:43.688+07
10	10	86	0.94	Sangat Cocok	\N	2026-02-16 02:40:43.694+07	2026-02-16 02:40:43.694+07
11	11	29	0.73	Sangat Cocok	\N	2026-02-16 02:40:43.701+07	2026-02-16 02:40:43.701+07
12	12	118	0.98	Sangat Cocok	\N	2026-02-16 02:40:43.708+07	2026-02-16 02:40:43.708+07
13	13	76	0.79	Sangat Cocok	\N	2026-02-16 02:40:43.715+07	2026-02-16 02:40:43.715+07
14	14	125	0.77	Sangat Cocok	\N	2026-02-16 02:40:43.723+07	2026-02-16 02:40:43.723+07
15	15	113	0.86	Sangat Cocok	\N	2026-02-16 02:40:43.729+07	2026-02-16 02:40:43.729+07
16	16	80	0.88	Sangat Cocok	\N	2026-02-16 02:40:43.737+07	2026-02-16 02:40:43.737+07
17	17	39	0.75	Sangat Cocok	\N	2026-02-16 02:40:43.743+07	2026-02-16 02:40:43.743+07
18	18	112	0.84	Sangat Cocok	\N	2026-02-16 02:40:43.749+07	2026-02-16 02:40:43.749+07
19	19	18	0.84	Sangat Cocok	\N	2026-02-16 02:40:43.756+07	2026-02-16 02:40:43.756+07
20	20	131	0.94	Sangat Cocok	\N	2026-02-16 02:40:43.762+07	2026-02-16 02:40:43.762+07
21	21	142	0.91	Sangat Cocok	\N	2026-02-16 02:40:43.767+07	2026-02-16 02:40:43.767+07
22	22	132	0.92	Sangat Cocok	\N	2026-02-16 02:40:43.774+07	2026-02-16 02:40:43.774+07
23	23	58	0.95	Sangat Cocok	\N	2026-02-16 02:40:43.781+07	2026-02-16 02:40:43.781+07
24	24	39	0.72	Sangat Cocok	\N	2026-02-16 02:40:43.79+07	2026-02-16 02:40:43.79+07
25	25	95	0.94	Sangat Cocok	\N	2026-02-16 02:40:43.797+07	2026-02-16 02:40:43.797+07
26	26	12	0.85	Sangat Cocok	\N	2026-02-16 02:40:43.803+07	2026-02-16 02:40:43.803+07
27	27	118	0.75	Sangat Cocok	\N	2026-02-16 02:40:43.809+07	2026-02-16 02:40:43.809+07
28	28	75	0.98	Sangat Cocok	\N	2026-02-16 02:40:43.817+07	2026-02-16 02:40:43.817+07
29	29	73	0.94	Sangat Cocok	\N	2026-02-16 02:40:43.824+07	2026-02-16 02:40:43.824+07
30	30	85	0.88	Sangat Cocok	\N	2026-02-16 02:40:43.83+07	2026-02-16 02:40:43.83+07
31	31	54	0.74	Sangat Cocok	\N	2026-02-16 02:40:43.839+07	2026-02-16 02:40:43.839+07
32	32	103	0.85	Sangat Cocok	\N	2026-02-16 02:40:43.845+07	2026-02-16 02:40:43.845+07
33	33	38	0.71	Sangat Cocok	\N	2026-02-16 02:40:43.852+07	2026-02-16 02:40:43.852+07
34	34	62	1.00	Sangat Cocok	\N	2026-02-16 02:40:43.859+07	2026-02-16 02:40:43.859+07
35	35	73	0.91	Sangat Cocok	\N	2026-02-16 02:40:43.866+07	2026-02-16 02:40:43.866+07
36	36	111	0.87	Sangat Cocok	\N	2026-02-16 02:40:43.873+07	2026-02-16 02:40:43.873+07
37	37	67	0.83	Sangat Cocok	\N	2026-02-16 02:40:43.879+07	2026-02-16 02:40:43.879+07
38	38	66	0.91	Sangat Cocok	\N	2026-02-16 02:40:43.886+07	2026-02-16 02:40:43.886+07
39	39	103	0.74	Sangat Cocok	\N	2026-02-16 02:40:43.892+07	2026-02-16 02:40:43.892+07
40	40	81	0.98	Sangat Cocok	\N	2026-02-16 02:40:43.898+07	2026-02-16 02:40:43.898+07
41	41	29	0.99	Sangat Cocok	\N	2026-02-16 02:40:43.906+07	2026-02-16 02:40:43.906+07
42	42	33	0.97	Sangat Cocok	\N	2026-02-16 02:40:43.912+07	2026-02-16 02:40:43.912+07
43	43	71	0.99	Sangat Cocok	\N	2026-02-16 02:40:43.917+07	2026-02-16 02:40:43.917+07
44	44	38	0.93	Sangat Cocok	\N	2026-02-16 02:40:43.925+07	2026-02-16 02:40:43.925+07
45	45	46	0.90	Sangat Cocok	\N	2026-02-16 02:40:43.931+07	2026-02-16 02:40:43.931+07
46	46	20	0.75	Sangat Cocok	\N	2026-02-16 02:40:43.938+07	2026-02-16 02:40:43.938+07
47	47	90	0.70	Sangat Cocok	\N	2026-02-16 02:40:43.944+07	2026-02-16 02:40:43.944+07
48	48	5	0.80	Sangat Cocok	\N	2026-02-16 02:40:43.951+07	2026-02-16 02:40:43.951+07
49	49	127	0.88	Sangat Cocok	\N	2026-02-16 02:40:43.958+07	2026-02-16 02:40:43.958+07
50	50	3	0.90	Sangat Cocok	\N	2026-02-16 02:40:43.963+07	2026-02-16 02:40:43.963+07
\.


--
-- Data for Name: DerivedProducts; Type: TABLE DATA; Schema: public; Owner: hutan_kita_user
--

COPY public."DerivedProducts" (id, "commodityId", name, category, "processDescription", "valueAddedMultiplier", "unitPrice", "priceUnit", "marketPotential", "createdAt", "updatedAt") FROM stdin;
1	2	Minyak Atsiri Pala	Minyak Atsiri	\N	8.00	1500000.00	Liter	Tinggi	2026-02-16 02:40:43.439+07	2026-02-16 02:40:43.439+07
2	2	Manisan Pala	Makanan Ringan	\N	2.00	30000.00	Bungkus	Tinggi	2026-02-16 02:40:43.444+07	2026-02-16 02:40:43.444+07
3	2	Sirup Pala	Minuman	\N	2.50	25000.00	Botol	Tinggi	2026-02-16 02:40:43.446+07	2026-02-16 02:40:43.446+07
4	3	Minyak Cengkeh	Minyak Atsiri	\N	6.00	800000.00	Liter	Tinggi	2026-02-16 02:40:43.449+07	2026-02-16 02:40:43.449+07
5	3	Rokok Kretek (Bahan Baku)	Industri	\N	1.20	120000.00	Kg	Tinggi	2026-02-16 02:40:43.452+07	2026-02-16 02:40:43.452+07
6	6	Minyak Goreng Kelapa	Olahan Pangan	\N	2.50	15000.00	Liter	Tinggi	2026-02-16 02:40:43.454+07	2026-02-16 02:40:43.454+07
7	6	VCO	Kesehatan	\N	5.00	50000.00	Botol 250ml	Tinggi	2026-02-16 02:40:43.457+07	2026-02-16 02:40:43.457+07
8	6	Gula Merah	Olahan Pangan	\N	1.50	12000.00	Kg	Tinggi	2026-02-16 02:40:43.459+07	2026-02-16 02:40:43.459+07
9	15	Bubuk Coklat	Makanan	\N	3.50	65000.00	Kg	Tinggi	2026-02-16 02:40:43.461+07	2026-02-16 02:40:43.461+07
10	15	Lemak Kakao	Industri Kosmetik	\N	5.00	150000.00	Kg	Tinggi	2026-02-16 02:40:43.463+07	2026-02-16 02:40:43.463+07
11	28	Kopi Bubuk Premium	Minuman	\N	3.00	80000.00	Kg	Tinggi	2026-02-16 02:40:43.465+07	2026-02-16 02:40:43.465+07
12	28	Kopi Green Bean	Bahan Baku	\N	1.50	40000.00	Kg	Tinggi	2026-02-16 02:40:43.467+07	2026-02-16 02:40:43.467+07
13	70	Minyak Cengkeh	Minyak Atsiri	\N	6.00	800000.00	Liter	Tinggi	2026-02-16 02:40:43.469+07	2026-02-16 02:40:43.469+07
14	70	Rokok Kretek (Bahan Baku)	Industri	\N	1.20	120000.00	Kg	Tinggi	2026-02-16 02:40:43.471+07	2026-02-16 02:40:43.471+07
15	71	Minyak Atsiri Pala	Minyak Atsiri	\N	8.00	1500000.00	Liter	Tinggi	2026-02-16 02:40:43.473+07	2026-02-16 02:40:43.473+07
16	71	Manisan Pala	Makanan Ringan	\N	2.00	30000.00	Bungkus	Tinggi	2026-02-16 02:40:43.475+07	2026-02-16 02:40:43.475+07
17	71	Sirup Pala	Minuman	\N	2.50	25000.00	Botol	Tinggi	2026-02-16 02:40:43.478+07	2026-02-16 02:40:43.478+07
18	93	Minyak Cengkeh	Minyak Atsiri	\N	6.00	800000.00	Liter	Tinggi	2026-02-16 02:40:43.48+07	2026-02-16 02:40:43.48+07
19	93	Rokok Kretek (Bahan Baku)	Industri	\N	1.20	120000.00	Kg	Tinggi	2026-02-16 02:40:43.483+07	2026-02-16 02:40:43.483+07
20	96	Minyak Cengkeh	Minyak Atsiri	\N	6.00	800000.00	Liter	Tinggi	2026-02-16 02:40:43.485+07	2026-02-16 02:40:43.485+07
21	96	Rokok Kretek (Bahan Baku)	Industri	\N	1.20	120000.00	Kg	Tinggi	2026-02-16 02:40:43.488+07	2026-02-16 02:40:43.488+07
22	129	Minyak Goreng Kelapa	Olahan Pangan	\N	2.50	15000.00	Liter	Tinggi	2026-02-16 02:40:43.49+07	2026-02-16 02:40:43.49+07
23	129	VCO	Kesehatan	\N	5.00	50000.00	Botol 250ml	Tinggi	2026-02-16 02:40:43.492+07	2026-02-16 02:40:43.492+07
24	129	Gula Merah	Olahan Pangan	\N	1.50	12000.00	Kg	Tinggi	2026-02-16 02:40:43.494+07	2026-02-16 02:40:43.494+07
\.


--
-- Data for Name: Districts; Type: TABLE DATA; Schema: public; Owner: hutan_kita_user
--

COPY public."Districts" (id, "regencyId", name, code, "createdAt", "updatedAt") FROM stdin;
1	1	16	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
2	2	Oba Selatan	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
3	2	Oba  	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
4	2	Tidore Utara	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
5	2	Oba Tengah	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
6	2	Oba	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
7	2	Tidore Selatan	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
8	2	Oba Utara	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
9	2	Tidore Timur	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
10	3	Pulau Ternate	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
11	3	Ternate Tengah	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
12	3	Pulau Hiri	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
13	3	Pulau Ternate 	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
14	3	Ternate Utara 	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
15	3	Moti	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
16	3	Ternate Barat	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
17	3	Pulau Batang Dua	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
18	4	Kao Utara	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
19	4	Malifut	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
20	4	Kao Teluk	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
21	4	Tobelo Utara	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
22	4	Galela	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
23	4	Tobelo	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
24	4	Galela Selatan	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
25	4	Kao	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
26	4	Kao Barat	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
27	4	Tobelo Selatan	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
28	4	Tobelo Selatan 	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
29	4	Galela Barat	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
30	4	Loloda Kepulauan	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
31	4	Galela Utara	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
32	4	Loloda Utara	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
33	4	Tobelo Barat	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
34	4	Tobelo Tengah	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
35	5	Kota Maba	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
36	5	Maba  	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
37	5	Maba Selatan	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
38	5	Maba Tengah 	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
39	5	Wasile Timur	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
40	5	Wasile Tengah	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
41	5	Wasile	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
42	5	Wasile Selatan	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
43	5	Wasile Utara	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
44	5	Maba	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
45	5	Maba Utara	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
46	6	Weda Selatan	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
47	6	Patani Timur	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
48	6	Weda Timur	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
49	6	Weda Utara	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
50	6	Petani Barat	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
51	6	Weda Tengah 	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
52	6	Patani Barat	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
53	6	Weda	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
54	7	Gane Barat	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
55	7	Bacan Timur Tengah	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
56	7	Bacan Selatan 	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
57	7	Bacan Selatan	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
58	7	Bacan Timur	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
59	7	Makian Barat	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
60	7	Bacan	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
61	7	-	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
62	8	Sulabesi Timur	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
63	8	Sulabesi Selatan	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
64	8	Sulabesi Tengah	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
65	8	Sanana	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
66	8	Sulabesi Barat	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
67	8	Mangoli Timur	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
68	8	Sanana Utara	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
69	8	Sulabesi Barat 	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
70	8	Mongali Utara Timur	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
71	9	Taliabu Timur	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
72	10	Morotai Utara	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
73	10	Morotai Jaya	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
74	10	Morotai Selatan 	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
75	10	Morotai Timur	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
76	10	Morotai Selatan Barat	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
77	10	Morotai Selatan	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
78	10	-	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
79	11	Jailolo	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
80	11	Ibu Selatan	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
81	11	Jailolo Selatan 	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
82	11	Ibu Utara	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
83	11	Loloda	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
84	11	Sahu Timur	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
85	11	Jailolo Selatan	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
86	11	Sahu	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
87	11	Ibu	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
88	11	Loloda Tengah	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
89	11	Tabaru	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
90	11	Sahu Timur 	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
91	11	Jailolo Timur	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
92	11	-	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
\.


--
-- Data for Name: EnvironmentalRisks; Type: TABLE DATA; Schema: public; Owner: hutan_kita_user
--

COPY public."EnvironmentalRisks" (id, "permitId", "riskType", "riskLevel", "riskScore", zone, description, "mitigationPlan", "yearAssessed", "createdAt", "updatedAt") FROM stdin;
1	3	Longsor	Sedang	\N	\N	Potensi longsor di lereng curam saat musim hujan	\N	2024	2026-02-16 02:40:43.642+07	2026-02-16 02:40:43.642+07
2	4	Longsor	Sedang	\N	\N	Potensi longsor di lereng curam saat musim hujan	\N	2024	2026-02-16 02:40:43.651+07	2026-02-16 02:40:43.651+07
3	5	Longsor	Sedang	\N	\N	Potensi longsor di lereng curam saat musim hujan	\N	2024	2026-02-16 02:40:43.659+07	2026-02-16 02:40:43.659+07
4	6	Longsor	Sedang	\N	\N	Potensi longsor di lereng curam saat musim hujan	\N	2024	2026-02-16 02:40:43.668+07	2026-02-16 02:40:43.668+07
5	8	Longsor	Sedang	\N	\N	Potensi longsor di lereng curam saat musim hujan	\N	2024	2026-02-16 02:40:43.683+07	2026-02-16 02:40:43.683+07
6	12	Longsor	Sedang	\N	\N	Potensi longsor di lereng curam saat musim hujan	\N	2024	2026-02-16 02:40:43.712+07	2026-02-16 02:40:43.712+07
7	14	Longsor	Sedang	\N	\N	Potensi longsor di lereng curam saat musim hujan	\N	2024	2026-02-16 02:40:43.726+07	2026-02-16 02:40:43.726+07
8	17	Longsor	Sedang	\N	\N	Potensi longsor di lereng curam saat musim hujan	\N	2024	2026-02-16 02:40:43.746+07	2026-02-16 02:40:43.746+07
9	22	Longsor	Sedang	\N	\N	Potensi longsor di lereng curam saat musim hujan	\N	2024	2026-02-16 02:40:43.777+07	2026-02-16 02:40:43.777+07
10	27	Longsor	Sedang	\N	\N	Potensi longsor di lereng curam saat musim hujan	\N	2024	2026-02-16 02:40:43.813+07	2026-02-16 02:40:43.813+07
11	30	Longsor	Sedang	\N	\N	Potensi longsor di lereng curam saat musim hujan	\N	2024	2026-02-16 02:40:43.833+07	2026-02-16 02:40:43.833+07
12	32	Longsor	Sedang	\N	\N	Potensi longsor di lereng curam saat musim hujan	\N	2024	2026-02-16 02:40:43.848+07	2026-02-16 02:40:43.848+07
13	33	Longsor	Sedang	\N	\N	Potensi longsor di lereng curam saat musim hujan	\N	2024	2026-02-16 02:40:43.855+07	2026-02-16 02:40:43.855+07
14	35	Longsor	Sedang	\N	\N	Potensi longsor di lereng curam saat musim hujan	\N	2024	2026-02-16 02:40:43.869+07	2026-02-16 02:40:43.869+07
15	44	Longsor	Sedang	\N	\N	Potensi longsor di lereng curam saat musim hujan	\N	2024	2026-02-16 02:40:43.927+07	2026-02-16 02:40:43.927+07
16	47	Longsor	Sedang	\N	\N	Potensi longsor di lereng curam saat musim hujan	\N	2024	2026-02-16 02:40:43.947+07	2026-02-16 02:40:43.947+07
17	48	Longsor	Sedang	\N	\N	Potensi longsor di lereng curam saat musim hujan	\N	2024	2026-02-16 02:40:43.954+07	2026-02-16 02:40:43.954+07
\.


--
-- Data for Name: ForestAreaStatuses; Type: TABLE DATA; Schema: public; Owner: hutan_kita_user
--

COPY public."ForestAreaStatuses" (id, code, name, "createdAt", "updatedAt") FROM stdin;
1	HL	HL	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
2	HP	HP	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
3	HPT	HPT	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
4	HPK	HPK	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
5	APL	APL	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
6	28	28	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
7	21	21	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
8	30	30	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
9	19	19	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
10	22	22	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
11	34	34	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
12	23	23	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
13	39	39	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
14	43	43	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
15	33	33	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
16	49	49	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
17	20	20	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
18	18	18	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
19	24	24	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
20	HL. HP	HL. HP	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
21	HL & HPT	HL & HPT	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
22	HPK & HPT	HPK & HPT	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
23	HPK & HL	HPK & HL	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
\.


--
-- Data for Name: GroupDemographics; Type: TABLE DATA; Schema: public; Owner: hutan_kita_user
--

COPY public."GroupDemographics" (id, "institutionId", "avgAge", "educationLevel", "avgFarmingExperience", "hasSmartphoneAccess", "hasInternetAccess", "smartphonePercent", "yearRecorded", "createdAt", "updatedAt") FROM stdin;
1	1	53.0	SD	14	t	f	81.17	2024	2026-02-16 02:40:43.611+07	2026-02-16 02:40:43.611+07
2	2	49.0	SMP	23	f	f	45.50	2024	2026-02-16 02:40:43.63+07	2026-02-16 02:40:43.63+07
3	3	45.0	SMA	24	t	f	17.88	2024	2026-02-16 02:40:43.639+07	2026-02-16 02:40:43.639+07
4	4	42.0	SMP	10	t	f	42.86	2024	2026-02-16 02:40:43.648+07	2026-02-16 02:40:43.648+07
5	5	42.0	SMP	8	f	t	45.93	2024	2026-02-16 02:40:43.656+07	2026-02-16 02:40:43.656+07
6	6	52.0	SD	15	f	t	89.95	2024	2026-02-16 02:40:43.664+07	2026-02-16 02:40:43.664+07
7	7	42.0	SMA	20	t	t	66.26	2024	2026-02-16 02:40:43.674+07	2026-02-16 02:40:43.674+07
8	8	54.0	SMA	18	t	t	1.32	2024	2026-02-16 02:40:43.681+07	2026-02-16 02:40:43.681+07
9	9	50.0	SD	17	t	t	67.27	2024	2026-02-16 02:40:43.689+07	2026-02-16 02:40:43.689+07
10	10	41.0	SD	17	t	t	22.26	2024	2026-02-16 02:40:43.695+07	2026-02-16 02:40:43.695+07
11	11	40.0	SMA	8	t	f	94.53	2024	2026-02-16 02:40:43.702+07	2026-02-16 02:40:43.702+07
12	12	41.0	SD	13	t	t	46.99	2024	2026-02-16 02:40:43.709+07	2026-02-16 02:40:43.709+07
13	13	50.0	SMP	24	t	t	74.97	2024	2026-02-16 02:40:43.715+07	2026-02-16 02:40:43.715+07
14	14	49.0	SD	17	f	f	79.56	2024	2026-02-16 02:40:43.724+07	2026-02-16 02:40:43.724+07
15	15	44.0	SMA	5	t	t	86.67	2024	2026-02-16 02:40:43.73+07	2026-02-16 02:40:43.73+07
16	16	45.0	SMA	6	t	f	23.15	2024	2026-02-16 02:40:43.738+07	2026-02-16 02:40:43.738+07
17	17	41.0	SD	19	f	f	11.34	2024	2026-02-16 02:40:43.743+07	2026-02-16 02:40:43.743+07
18	18	50.0	SD	9	t	t	69.15	2024	2026-02-16 02:40:43.75+07	2026-02-16 02:40:43.75+07
19	19	48.0	SMP	12	t	f	4.01	2024	2026-02-16 02:40:43.757+07	2026-02-16 02:40:43.757+07
20	20	51.0	SMP	19	t	t	10.75	2024	2026-02-16 02:40:43.762+07	2026-02-16 02:40:43.762+07
21	21	52.0	SMP	11	f	t	81.60	2024	2026-02-16 02:40:43.767+07	2026-02-16 02:40:43.767+07
22	22	46.0	SMA	22	t	f	69.91	2024	2026-02-16 02:40:43.775+07	2026-02-16 02:40:43.775+07
23	23	50.0	SMP	24	t	f	47.67	2024	2026-02-16 02:40:43.781+07	2026-02-16 02:40:43.781+07
24	24	43.0	SD	16	f	t	43.87	2024	2026-02-16 02:40:43.791+07	2026-02-16 02:40:43.791+07
25	25	54.0	SD	24	t	f	6.56	2024	2026-02-16 02:40:43.797+07	2026-02-16 02:40:43.797+07
26	26	40.0	SMP	10	f	t	53.59	2024	2026-02-16 02:40:43.804+07	2026-02-16 02:40:43.804+07
27	27	48.0	SMA	19	t	t	5.73	2024	2026-02-16 02:40:43.81+07	2026-02-16 02:40:43.81+07
28	28	44.0	SMP	6	f	f	22.88	2024	2026-02-16 02:40:43.817+07	2026-02-16 02:40:43.817+07
29	29	42.0	SD	20	t	t	92.21	2024	2026-02-16 02:40:43.825+07	2026-02-16 02:40:43.825+07
30	30	52.0	SMP	5	t	f	36.80	2024	2026-02-16 02:40:43.831+07	2026-02-16 02:40:43.831+07
31	31	54.0	SMA	12	f	t	75.72	2024	2026-02-16 02:40:43.84+07	2026-02-16 02:40:43.84+07
32	32	51.0	SMP	11	t	t	90.93	2024	2026-02-16 02:40:43.846+07	2026-02-16 02:40:43.846+07
33	33	43.0	SMA	18	t	f	81.51	2024	2026-02-16 02:40:43.853+07	2026-02-16 02:40:43.853+07
34	34	53.0	SMP	18	f	f	19.77	2024	2026-02-16 02:40:43.86+07	2026-02-16 02:40:43.86+07
35	35	54.0	SMP	6	t	t	87.58	2024	2026-02-16 02:40:43.866+07	2026-02-16 02:40:43.866+07
36	36	46.0	SD	15	t	f	9.75	2024	2026-02-16 02:40:43.873+07	2026-02-16 02:40:43.873+07
37	37	42.0	SMA	22	f	t	60.24	2024	2026-02-16 02:40:43.88+07	2026-02-16 02:40:43.88+07
38	38	54.0	SD	16	t	t	19.16	2024	2026-02-16 02:40:43.887+07	2026-02-16 02:40:43.887+07
39	39	42.0	SD	23	f	f	57.98	2024	2026-02-16 02:40:43.893+07	2026-02-16 02:40:43.893+07
40	40	44.0	SMA	6	f	f	53.71	2024	2026-02-16 02:40:43.899+07	2026-02-16 02:40:43.899+07
41	41	41.0	SD	6	f	t	32.65	2024	2026-02-16 02:40:43.907+07	2026-02-16 02:40:43.907+07
42	42	48.0	SD	11	t	t	8.23	2024	2026-02-16 02:40:43.912+07	2026-02-16 02:40:43.912+07
43	43	53.0	SD	12	f	f	60.22	2024	2026-02-16 02:40:43.918+07	2026-02-16 02:40:43.918+07
44	44	43.0	SMP	24	t	t	12.90	2024	2026-02-16 02:40:43.925+07	2026-02-16 02:40:43.925+07
45	45	41.0	SMP	16	t	f	17.60	2024	2026-02-16 02:40:43.932+07	2026-02-16 02:40:43.932+07
46	46	46.0	SMP	20	t	t	15.20	2024	2026-02-16 02:40:43.939+07	2026-02-16 02:40:43.939+07
47	47	48.0	SMA	24	t	f	72.19	2024	2026-02-16 02:40:43.944+07	2026-02-16 02:40:43.944+07
48	48	49.0	SD	11	f	t	56.42	2024	2026-02-16 02:40:43.952+07	2026-02-16 02:40:43.952+07
49	49	49.0	SMA	16	t	f	54.42	2024	2026-02-16 02:40:43.958+07	2026-02-16 02:40:43.958+07
50	50	43.0	SMA	7	t	t	87.41	2024	2026-02-16 02:40:43.964+07	2026-02-16 02:40:43.964+07
\.


--
-- Data for Name: InstitutionContacts; Type: TABLE DATA; Schema: public; Owner: hutan_kita_user
--

COPY public."InstitutionContacts" (id, "institutionId", "contactType", "contactValue", "isPrimary", "createdAt", "updatedAt") FROM stdin;
1	1	phone	14	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
2	2	phone	081243568688	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
3	4	phone	081230990097	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
4	6	phone	082194652525	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
5	7	phone	082298395839	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
6	8	phone	081379727207	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
7	10	phone	082187473559	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
8	11	phone	082290388201	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
9	12	phone	081376176899	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
10	13	phone	082243553004	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
11	14	phone	081356954803	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
12	15	phone	081242288024	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
13	16	phone	082196635066	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
14	17	phone	081245626691	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
15	18	phone	081245466002	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
16	19	phone	082187325408	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
17	20	phone	081242280711	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
18	21	phone	082338914485	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
19	22	phone	082192650403	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
20	23	phone	082189316289	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
21	24	phone	082194311906	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
22	35	phone	085397722943	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
23	36	phone	081241971076	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
24	38	phone	081242957542	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
25	39	phone	082194815158	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
26	40	phone	082347200860	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
27	42	phone	0856566245030	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
28	44	phone	082195382093	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
29	45	phone	081253854842	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
30	52	phone	081341263642	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
31	53	phone	082194312103	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
32	54	phone	082191599776	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
33	55	phone	082271252051	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
34	56	phone	081354677393	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
35	57	phone	082293161237	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
36	58	phone	085397986173	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
37	59	phone	082271516334	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
38	60	phone	082349246633	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
39	61	phone	082188558371	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
40	62	phone	082136366206	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
41	63	phone	082271529961	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
42	64	phone	081217924307	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
43	65	phone	082119429229	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
44	66	phone	082347008280	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
45	67	phone	081342789954	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
46	68	phone	081241046580	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
47	69	phone	081380373713	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
48	70	phone	085756914027	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
49	71	phone	082290833678	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
50	72	phone	085656738707	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
51	73	phone	081543140630	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
52	74	phone	082346419262	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
53	75	phone	085732187464	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
54	76	phone	082199146129	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
55	77	phone	081342501510	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
56	78	phone	08242410326/ 082291777740	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
57	79	phone	085146008841	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
58	80	phone	082144040518	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
59	81	phone	085241736406	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
60	82	phone	085240169158	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
61	83	phone	082195900847	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
62	84	phone	081323237091	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
63	85	phone	082193980383	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
64	86	phone	0802190025900	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
65	87	phone	082192808948	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
66	88	phone	081340794416	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
67	89	phone	082193033768	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
68	90	phone	082192808948	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
69	91	phone	082262758342	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
70	92	phone	081244872385	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
71	93	phone	082352834811	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
72	94	phone	082210473087	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
73	95	phone	081211519396	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
74	96	phone	085328218673	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
75	97	phone	082195569572	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
76	98	phone	082223521770	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
77	99	phone	081341912274	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
78	100	phone	082127405060	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
79	101	phone	082334093571	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
80	102	phone	085145907642	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
81	103	phone	085145312317	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
82	104	phone	082346363533	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
83	105	phone	085255607871	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
84	106	phone	081245901121	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
85	107	phone	081241386009	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
86	108	phone	082214682411	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
87	109	phone	082188962544	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
88	110	phone	082215382882	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
89	111	phone	082195643739	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
90	112	phone	082149824671	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
91	113	phone	085240239517	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
92	114	phone	082124947545	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
93	115	phone	081356753717	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
94	116	phone	082228073085	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
95	117	phone	082378868250	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
96	118	phone	081244199391	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
97	121	phone	081348888429	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
98	122	phone	082119197711	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
99	123	phone	082189969550	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
100	124	phone	081323140715	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
101	125	phone	081245379078	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
102	126	phone	082292065580	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
103	127	phone	081241548725	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
104	128	phone	081218550762	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
105	129	phone	082213665010	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
106	130	phone	081298453887	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
107	131	phone	082188817077	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
108	132	phone	081291339974	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
109	133	phone	082291830397	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
110	134	phone	081242471656	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
111	135	phone	081325298563	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
112	136	phone	085241180752/081356618444	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
113	137	phone	081346869507	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
114	138	phone	082190378366	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
115	139	phone	082190378367	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
116	140	phone	082187220569	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
117	141	phone	082336269526/0813425554514	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
118	142	phone	081343904804	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
119	143	phone	081242819129	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
120	144	phone	082155998915	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
121	145	phone	081376532389	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
122	146	phone	081273637963	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
123	147	phone	081348202192	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
124	148	phone	081244799433	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
125	149	phone	081313880001	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
126	150	phone	082123523583	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
127	151	phone	082290526946	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
128	152	phone	082192315812	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
129	153	phone	081243396397	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
130	154	phone	085245642041	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
131	155	phone	082292472632	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
132	156	phone	082271544948	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
133	157	phone	082114355406	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
134	158	phone	081240685440	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
135	159	phone	082114801430	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
136	160	phone	081348683986	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
137	161	phone	082191455235	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
138	162	phone	082123534464	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
139	163	phone	081342700441	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
140	164	phone	081236854155	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
141	165	phone	081355638723	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
142	166	phone	081242897885	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
143	167	phone	081236854155	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
144	168	phone	082189490939	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
145	169	phone	081243800154	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
146	170	phone	081230898687	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
147	171	phone	082196732868	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
148	172	phone	085398530086	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
149	173	phone	082347975381	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
150	174	phone	081340809590	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
151	175	phone	082193659055	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
152	176	phone	081354977682	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
153	177	phone	081247216522	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
154	178	phone	085340263159	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
155	179	phone	081381458519	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
156	180	phone	081342225136	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
157	182	phone	082187739692	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
158	183	phone	082347354773	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
159	184	phone	082195803937	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
160	185	phone	081342310282	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
161	186	phone	081245211134	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
162	191	phone	081243325045	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
163	192	phone	081245304016	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
164	193	phone	085299239418	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
165	194	phone	082194424066	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
166	195	phone	082290673565	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
167	196	phone	081344155763	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
168	197	phone	081235720529	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
169	198	phone	082195031248	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
170	199	phone	081243092388	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
171	200	phone	082311619482	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
172	201	phone	082196080559	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
173	202	phone	085240506857	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
174	203	phone	081296113702	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
175	204	phone	081242078539	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
176	205	phone	081340372957	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
177	206	phone	081342230794	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
178	207	phone	081356492075	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
179	208	phone	081212214619	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
180	209	phone	081243732476	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
181	210	phone	081354821824	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
182	211	phone	081243641169	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
183	212	phone	082348472594	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
184	213	phone	082348227430	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
185	214	phone	082193057799	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
186	215	phone	081345183547	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
187	216	phone	085245642041	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
188	217	phone	082187719341	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
189	218	phone	082358400312	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
190	219	phone	081341547564	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
191	220	phone	081241415110	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
192	221	phone	081390710325	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
193	222	phone	082187322080	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
194	223	phone	085240594508	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
195	224	phone	082187322080	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
196	228	phone	085394235988	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
197	229	phone	082347509772	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
198	230	phone	082290968813	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
199	231	phone	081245051763	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
200	232	phone	081342121430	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
201	233	phone	081342559323	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
202	234	phone	081242132313	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
203	235	phone	082358790124	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
204	236	phone	081268886140	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
205	237	phone	085394922301	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
206	238	phone	081251820021	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
207	239	phone	085324669059	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
208	240	phone	08218956674	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
209	241	phone	082155337055	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
210	242	phone	082188919857	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
211	243	phone	081244740003	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
212	244	phone	082159383517	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
213	246	phone	081292534793	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
214	247	phone	082271270572	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
215	248	phone	082338556357	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
216	249	phone	082291209918	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
217	250	phone	082293681546	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
218	251	phone	082199800563	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
219	252	phone	082187249296	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
220	253	phone	081524971098	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
221	254	phone	081241915967	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
222	255	phone	081341525667	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
223	256	phone	081340092256	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
224	257	phone	085298980784	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
225	258	phone	082116102351	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
226	259	phone	081245211134	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
227	261	phone	082393686128	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
228	262	phone	082292952723	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
229	263	phone	082114460540	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
230	264	phone	082196667526	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
231	265	phone	081355321104	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
232	266	phone	085696269537	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
233	267	phone	082113182292	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
234	268	phone	082191805195	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
235	269	phone	082245106765	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
236	270	phone	085796530037	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
237	271	phone	081212154690	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
238	272	phone	081382049215	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
239	273	phone	082346026315	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
240	274	phone	082353327251	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
241	275	phone	081254849537	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
242	276	phone	087841514955	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
243	278	phone	082191489614	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
244	279	phone	082190858916	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
245	280	phone	081398375458	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
246	281	phone	083878350432	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
247	282	phone	082347750133	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
248	283	phone	082346408527	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
249	284	phone	082152234202	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
250	285	phone	081340768672	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
251	287	phone	085342342456	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
252	288	phone	081356361119	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
253	289	phone	081279707291	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
254	290	phone	081355796784	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
255	292	phone	081344858202	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
256	293	phone	085341422932	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
257	294	phone	085342880204	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
258	295	phone	082114194426	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
259	296	phone	085341771828	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
260	297	phone	081237719355	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
261	298	phone	081237719355	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
262	299	phone	082187008389	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
263	301	phone	085311410721	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
264	302	phone	081245567553	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
265	303	phone	082290054679	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
266	304	phone	082188389210	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
267	305	phone	082114138718	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
268	306	phone	081355321104	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
269	307	phone	085341648316	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
270	308	phone	081242583771	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
271	309	phone	082349773525	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
272	310	phone	082188231225	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
273	311	phone	082116102351	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
274	312	phone	082332510545	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
275	313	phone	081342652204	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
276	314	phone	082190212039	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
277	315	phone	081244235375	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
278	317	phone	081247104383	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
279	318	phone	085242653370	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
280	319	phone	082188155526	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
281	320	phone	081344717440	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
282	321	phone	082214070748	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
283	322	phone	081245878855	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
284	323	phone	081218578463	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
285	324	phone	081998634559	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
286	325	phone	081245655760	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
287	326	phone	081243628032	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
288	327	phone	082292906009	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
289	328	phone	081245905275	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
\.


--
-- Data for Name: InstitutionMembers; Type: TABLE DATA; Schema: public; Owner: hutan_kita_user
--

COPY public."InstitutionMembers" (id, "institutionId", "totalMembers", "totalHouseholds", "yearRecorded", "createdAt", "updatedAt") FROM stdin;
1	1	29	30	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
2	2	315	0	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
3	3	309	0	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
4	4	205	0	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
5	5	203	0	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
6	6	116	0	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
7	7	127	0	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
8	8	251	0	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
9	9	338	0	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
10	10	23	0	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
11	11	255	0	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
12	12	43	0	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
13	13	98	0	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
14	14	400	0	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
15	15	137	0	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
16	16	19	0	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
17	17	30	0	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
18	18	33	0	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
19	19	49	0	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
20	20	20	0	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
21	21	179	0	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
22	22	71	0	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
23	23	118	0	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
24	24	105	0	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
25	25	33	271	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
26	26	41	369	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
27	28	31	336	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
28	29	37	453	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
29	30	35	125	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
30	33	21	21	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
31	34	32	32	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
32	35	23	23	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
33	36	40	40	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
34	37	20	20	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
35	38	31	31	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
36	39	19	37	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
37	40	27	27	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
38	41	20	20	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
39	42	23	23	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
40	43	23	23	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
41	44	28	51	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
42	45	30	205	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
43	52	28	679	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
44	53	36	583	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
45	54	36	836	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
46	55	56	118	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
47	56	35	67	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
48	57	21	216	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
49	58	22	585	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
50	59	18	206	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
51	60	23	23	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
52	61	0	251	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
53	62	22	22	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
54	63	42	42	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
55	64	26	549	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
56	65	0	248	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
57	66	0	309	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
58	67	0	329	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
59	68	20	76	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
60	69	36	224	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
61	70	0	222	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
62	71	0	184	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
63	72	0	71	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
64	73	0	78	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
65	74	22	89	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
66	75	15	274	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
67	76	0	31	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
68	77	16	243	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
69	78	0	115	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
70	79	19	78	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
71	80	24	24	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
72	81	45	45	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
73	82	28	230	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
74	83	31	132	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
75	84	19	284	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
76	85	40	538	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
77	86	50	50	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
78	87	17	375	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
79	88	22	22	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
80	89	19	19	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
81	90	20	109	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
82	91	27	121	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
83	92	0	291	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
84	93	34	80	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
85	94	18	2502	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
86	95	22	830	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
87	96	18	184	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
88	97	62	153	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
89	98	39	101	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
90	99	22	824	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
91	100	23	359	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
92	101	25	25	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
93	102	99	349	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
94	103	0	686	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
95	104	0	378	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
96	105	0	314	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
97	106	0	363	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
98	107	33	274	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
99	108	24	407	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
100	109	111	194	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
101	110	15	573	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
102	111	35	35	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
103	112	27	222	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
104	113	33	274	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
105	114	20	740	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
106	115	17	353	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
107	116	15	181	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
108	117	21	430	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
109	118	15	114	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
110	119	0	395	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
111	120	15	267	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
112	121	15	579	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
113	122	21	301	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
114	123	57	120	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
115	124	129	253	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
116	125	160	161	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
117	126	146	146	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
118	127	112	112	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
119	128	226	226	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
120	129	35	586	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
121	130	46	57	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
122	131	126	218	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
123	132	36	224	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
124	133	0	382	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
125	134	0	243	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
126	135	33	508	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
127	136	0	319	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
128	137	0	201	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
129	138	36	332	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
130	139	0	254	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
131	141	17	256	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
132	142	30	232	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
133	143	24	178	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
134	144	40	238	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
135	145	37	227	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
136	146	25	144	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
137	147	36	307	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
138	148	26	174	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
139	149	63	63	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
140	150	41	242	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
141	151	100	706	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
142	152	0	118	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
143	153	21	98	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
144	154	34	34	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
145	155	38	167	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
146	156	44	125	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
147	157	31	230	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
148	158	29	221	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
149	159	28	136	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
150	160	26	26	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
151	161	0	611	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
152	162	24	181	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
153	163	41	223	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
154	164	21	439	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
155	165	25	25	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
156	166	33	33	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
157	167	18	644	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
158	168	22	316	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
159	169	21	436	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
160	170	30	191	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
161	171	21	146	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
162	172	21	151	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
163	173	19	251	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
164	174	34	128	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
165	175	36	198	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
166	176	32	796	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
167	177	41	64	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
168	178	21	97	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
169	179	24	155	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
170	180	21	864	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
171	181	585	585	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
172	182	0	20	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
173	183	0	40	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
174	184	0	20	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
175	185	0	32	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
176	186	0	27	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
177	191	0	235	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
178	192	0	237	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
179	193	21	142	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
180	194	37	669	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
181	195	25	85	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
182	196	22	65	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
183	197	0	123	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
184	198	21	180	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
185	199	36	221	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
186	200	556	556	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
187	201	420	420	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
188	202	21	232	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
189	203	139	211	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
190	204	27	320	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
191	205	26	563	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
192	207	21	353	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
193	208	604	604	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
194	209	36	166	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
195	210	22	192	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
196	211	21	203	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
197	212	0	414	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
198	213	20	290	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
199	214	17	204	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
200	215	19	190	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
201	216	24	560	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
202	217	19	103	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
203	218	26	226	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
204	219	0	321	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
205	220	21	178	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
206	221	22	142	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
207	222	20	315	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
208	223	23	23	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
209	224	24	300	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
210	228	49	237	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
211	229	68	217	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
212	230	72	139	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
213	231	127	607	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
214	232	62	206	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
215	233	72	129	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
216	234	575	575	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
217	235	46	138	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
218	236	17	143	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
219	237	30	226	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
220	238	58	165	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
221	239	429	429	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
222	240	202	202	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
223	241	628	628	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
224	242	36	691	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
225	243	31	165	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
226	244	32	82	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
227	245	48	48	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
228	246	68	150	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
229	247	246	246	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
230	248	73	87	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
231	249	0	62	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
232	250	88	215	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
233	251	325	325	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
234	252	0	28	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
235	253	0	51	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
236	254	27	151	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
237	255	36	108	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
238	256	0	56	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
239	257	18	153	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
240	258	15	695	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
241	259	100	187	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
242	260	59	59	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
243	261	102	102	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
244	262	31	208	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
245	263	51	51	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
246	264	24	220	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
247	265	0	36	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
248	266	15	162	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
249	267	339	339	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
250	268	26	103	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
251	269	30	30	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
252	270	18	80	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
253	271	31	205	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
254	272	25	91	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
255	273	20	254	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
256	274	41	94	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
257	275	0	30	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
258	276	22	130	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
259	277	21	144	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
260	278	24	137	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
261	279	21	188	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
262	280	25	80	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
263	281	25	150	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
264	282	0	25	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
265	283	67	188	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
266	284	158	158	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
267	285	24	470	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
268	286	34	0	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
269	287	61	61	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
270	288	75	75	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
271	289	182	182	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
272	290	18	80	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
273	291	34	34	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
274	292	24	62	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
275	293	89	89	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
276	294	32	102	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
277	295	251	251	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
278	296	176	176	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
279	297	0	57	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
280	298	0	101	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
281	299	21	117	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
282	300	32	0	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
283	301	21	134	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
284	302	36	260	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
285	303	17	526	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
286	304	20	53	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
287	305	328	328	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
288	306	15	266	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
289	307	264	264	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
290	308	0	40	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
291	309	16	30	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
292	310	145	145	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
293	311	0	27	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
294	312	15	153	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
295	313	0	35	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
296	314	14	153	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
297	315	16	230	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
298	316	701	701	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
299	317	105	122	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
300	318	0	63	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
301	319	36	131	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
302	320	36	57	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
303	321	108	108	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
304	322	189	189	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
305	323	0	64	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
306	324	0	50	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
307	325	0	31	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
308	326	120	120	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
309	327	190	190	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
310	328	21	157	2025	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
\.


--
-- Data for Name: InstitutionTypes; Type: TABLE DATA; Schema: public; Owner: hutan_kita_user
--

COPY public."InstitutionTypes" (id, code, name, description, "createdAt", "updatedAt") FROM stdin;
1	LPHD	LPHD	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
2	KTH	KTH	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
3	LD	LD	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
4	Koperasi	Koperasi	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
5	KT	KT	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
6	Gapoktan	Gapoktan	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
7	10	10	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
\.


--
-- Data for Name: Institutions; Type: TABLE DATA; Schema: public; Owner: hutan_kita_user
--

COPY public."Institutions" (id, "institutionTypeId", "shortName", "fullName", "chairmanName", "isActive", "businessPlanStatus", "aepStatus", "createdAt", "updatedAt") FROM stdin;
1	7	11	12	13	t	9	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
2	1	Kususinopa	LPHD. Kususinopa	Harun Kasman	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
3	1	Lifofa	LPHD. Lifofa	Bakri Yasim	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
4	1	Nuku	LPHD. Nuku	Sudarman R. Husain	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
5	1	Selamalofo	LPHD. Selamalofo	Manase Brael	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
6	1	Sigela Yef	LPHD. Sigela Yef	Hengki Olii	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
7	1	Tagalaya	LPHD. Tagalaya	Husain Hi. Kamari	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
8	1	Toseho	LPHD. Toseho	Hasan Suleman	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
9	1	Wama	LPHD. Wama	Halil Karim	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
10	2	Akebay Mandiri	KTH. Akebay Mandiri	Sukardi Hamanas	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
11	1	Aketobololo	LPHD. Aketobololo	Ismail Kasim	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
12	2	Baru Mekar	KTH. Baru Mekar	Abu Haris La Bundo	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
13	1	Buwaru Makota	LPHD. Buwaru Makota	Harun Ahmad	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
14	1	Dorokolano	LPHD. Dorokolano	Ikbal Canaba	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
15	1	Fomarimoi	LPHD. Fomarimoi	Taher Hadi	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
16	2	Halaro	KTH. Halaro	Aswad Ahmad	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
17	2	Kosa	KTH. Kosa	Nasrun Harun	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
18	2	Mafu Lada	KTH. Mafu Lada	Ramli Kader	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
19	2	Mali Maake	KTH. Mali Maake	Jamaludin Muhammad	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
20	2	Samsibar Jaya	KTH. Samsibar Jaya	Abubakar Buka	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
21	1	Tadupi	LPHD. Tadupi	Wahab Haji Ibrahim	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
22	1	Talasi	LPHD. Talasi	Ardanan Kene	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
23	1	Tauno	LPHD. Tauno	Risal Mukmin	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
24	1	Woda	LPHD. Woda	Sukiman Salasa	t	2024	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
25	1	Baharu	LPHD. Baharu	Jufri Hi Hatari	t	KPS	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
26	1	Ake Balanda	LPHD. Ake Balanda	Rajab Hi Hayat	t	KUPS	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
27	2	Ake Guraci	KTH. Ake Guraci	Hamadal Minggu	t	KUPS	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
28	1	Buku Manyeku	LPHD. Buku Manyeku	Dahlan Tuniku	t	KUPS	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
29	3	Fomaku Dodara	LD. Fomaku Dodara	Aludin Jahum	t	KUPS	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
30	1	Qahabanga	LPHD. Qahabanga	Idhar B Jeb	t	KUPS	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
31	2	Rubahongi	KTH. Rubahongi	Munir Jalil	t	KUPS	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
32	2	Tunas Muda	KTH. Tunas Muda	H Ade Wahid	t	KUPS	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
33	2	Ake Boky	KTH. Ake Boky	Muhammad Achmad	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
34	2	Lingga Lamo	KTH. Lingga Lamo	Ali M. Din	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
35	2	Ake Mambangun	KTH. Ake Mambangun	Aswad Robo	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
36	2	Bido Jaya	KTH. Bido Jaya	Demitrius Lette	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
37	2	Fakati Amo	KTH. Fakati Amo	Ludhar Munir	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
38	2	Imanuel	KTH. Imanuel	Yoskap Pura	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
39	2	Jere Mado	KTH. Jere Mado	Sunardi Noho	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
40	2	Karya Mayau	KTH. Karya Mayau	Ekwin Dudes Taliwunan	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
41	2	Kie Para Jaya	KTH. Kie Para Jaya	Habsyi A Gani	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
42	2	Lestari Hutan Togafo	KTH. Lestari Hutan Togafo	Sardi Tamim	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
43	2	Makaamak	KTH. Makaamak	Faner Abubakar	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
44	2	Tolire Gam Jaha	KTH. Tolire Gam Jaha	Taher Ade	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
45	3	Sangaji Jaya	LD. Sangaji Jaya	Yunus Difa	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
46	3	Bori	LD. Bori	PRIKLES A. LIMPONG	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
47	3	Bukit Tinggi	LD. Bukit Tinggi	\N	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
48	3	Makaeling	LD. Makaeling	WAHAB ENCE	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
49	3	Wateto	LD. Wateto	WILYAM YAMES HALEAN	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
50	1	Gorua Utara	LPHD. Gorua Utara	FIRDAUS HUSEN BABA	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
51	1	Simau	LPHD. Simau	ALIFUDIN RAUF	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
52	3	MKCM	LD. MKCM	Markus Palan	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
53	1	Pomasi Ngongano	LPHD. Pomasi Ngongano	Muhammad Taher	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
54	1	Soakonora	LPHD. Soakonora	Indras Seng	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
55	1	Popon	LPHD. Popon	Marinus Golet	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
56	1	Momoda	LPHD. Momoda	Alpianus Pattinasarany	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
57	1	Bobale	LPHD. Bobale	Ardi Pattiasina	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
58	1	Daru	LPHD. Daru	Asariel Nanlohy	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
59	1	Talaga Paca	LPHD. Talaga Paca	Kalvin Dehela	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
60	2	Niamara	KTH. Niamara	Agustinus Yan	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
61	1	Roko	LPHD. Roko	Yani Bae	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
62	3	Jikolamo	LD. Jikolamo	Mursal Lotono	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
63	3	Tobo-Tobo	LD. Tobo-Tobo	Roni Hamajen	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
64	1	Mamuya	LPHD. Mamuya	Sababil Parasaja	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
65	1	Pune	LPHD. Pune	M. Sadarudin Serang	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
66	1	Samuda	LPHD. Samuda	Lukas Kailupa	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
67	1	Soatabaru	LPHD. Soatabaru	Estepanus Utubulang	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
68	3	Jere Tua	LD. Jere Tua	Rinto Mancari	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
69	1	Saluta	LPHD. Saluta	Rolan Welem	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
70	1	Tutumaloleo	LPHD. Tutumaloleo	Jamrud Pune	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
71	1	Sumber Tani	LPHD. Sumber Tani	Budiono	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
72	1	Gagaapok	LPHD. Gagaapok	Donald Pier Tango-Tango	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
73	1	Ngoali	LPHD. Ngoali	Yakobus Manjanga	t	2024	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
74	3	Soahukum	LD. Soahukum	Astentinus Dorohungi	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
75	3	Soamaetek	LD. Soamaetek	Herlin Laleno	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
76	3	Tolabit	LD. Tolabit	Joas Papua	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
77	3	Toliwang	LD. Toliwang	Kristian Buael	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
78	3	Akelamo Kao	LD. Akelamo Kao	Djauhar Momole	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
79	1	Boulamo	LPHD. Boulamo	Yusup Halo	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
80	3	Cera	LD. Cera	Marselon Tulele	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
81	3	Dagasuli	LD. Dagasuli	Nadira Al Musawa	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
82	3	Dedeta	LD. Dedeta	Ahmad Sikabayo	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
83	3	Dowonggila	LD. Dowonggila	Steven Litimi	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
84	3	Fitako	LD. Fitako	Asnidar Lovonita	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
85	3	Salube	LD. Salube	Waldi Hi Rauf, S.Hi	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
86	3	Doitia	LD. Doitia	Aristo Falagaku	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
87	3	Pocoa	LD. Pocoa	Yusnan Rence	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
88	3	Podol	LD. Podol	Hendrik Salama	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
89	3	Teru-Teru	LD. Teru-Teru	Demetrius Ngongira	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
90	3	Wori Moi	LD. Wori Moi	Rustam Wahab	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
91	3	Bobililait	LD. Bobililait	Kristovel Sarepa	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
92	1	Solita	LPHD. Solita	Ayub Abd. Karim	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
93	3	Tafasoho	LD. Tafasoho	M. Naser Syamsudin	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
94	3	Gamsungi	LD. Gamsungi	Orgenes Pulo	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
95	3	Gosoma	LD. Gosoma	Dominggus Masuru	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
96	3	Lemah Ino	LD. Lemah Ino	Yon Silain	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
97	3	Nimi Lega Kakara	LD. Nimi Lega Kakara	Libret Hiara	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
98	3	Nimidora Tagalaya	LD. Nimidora Tagalaya	Obet Moloku	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
99	3	Wari	LD. Wari	Robinson Bubala	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
100	3	Wari Ino	LD. Wari Ino	Yunias Bubala	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
101	3	Wangongira	LD. Wangongira	Abdon Dati	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
102	1	Gamhoku	LPHD. Gamhoku	Raimond Moloku	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
103	1	Kupa Kupa Horimaoi	LPHD. Kupa Kupa Horimaoi	Yoab Uboro	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
104	1	Pale	LPHD. Pale	Karlijan Adam	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
105	1	Tioua	LPHD. Tioua	Agustinus Oya	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
106	1	Efi-efi	LPHD. Efi-efi	Mateis Haluang	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
107	3	Kalipitu	LD. Kalipitu	Bernis Ansiga	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
108	3	Pitu	LD. Pitu	Pitu	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
109	3	Kokota Jaya	LD. Kokota Jaya	Sofian Dawile	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
110	3	Popilo	LD. Popilo	Takdir Suriadi	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
111	3	Ruko	LD. Ruko	Berson Paliema	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
112	3	Tolonuo	LD. Tolonuo	Haris Podo	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
113	3	Tolonuo Selatan	LD. Tolonuo Selatan	Rono Eteke	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
114	3	Soa Sangaji	LD. Soa Sangaji	Haruna Lawer	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
115	3	Buli Karya	LD. Buli Karya	Usman Batawi S	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
116	3	Teluk Buli	LD. Teluk Buli	Saleh Marsaoly	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
117	3	Sowoli	LD. Sowoli	Jasadi Jumat	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
118	3	Bangul	LD. Bangul	Rasidun Doliup	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
119	3	Dakaino	LD. Dakaino	\N	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
120	3	Soa Laipoh	LD. Soa Laipoh	Amir Sarani	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
121	3	Tutuling Jaya	LD. Tutuling Jaya	Rajibu Soa	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
122	3	Foli	LD. Foli	Mujir Jafar	t	Belum	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
123	1	Gulapapo	LPHD. Gulapapo	Hotman Riamanti Buli	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
124	1	Subaim	LPHD. Subaim	Hasim Reiwayalele	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
125	2	Arababu	KTH. Arababu	Johan Aralaha	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
126	2	Arung Sejati	KTH. Arung Sejati	Suharman Jalal	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
127	2	Bukit Wato Wato	KTH. Bukit Wato Wato	Berti Hohakai	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
128	2	Gapoktan Satu Hati	KTH. Gapoktan Satu Hati	Muhamad Khias	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
129	1	Dodaga	LPHD. Dodaga	Sulaiman Pitat	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
130	2	Oyoku Garuda Iye	KTH. Oyoku Garuda Iye	Epdonhard Bata	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
131	1	Hilaitetor	LPHD. Hilaitetor	Maklon Tarom	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
132	1	Wailukum	LPHD. Wailukum	Muhammad Abjan	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
133	3	Buli	LD. Buli	Moses Broni	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
134	3	Buli Asal	LD. Buli Asal	Gerson Baepa	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
135	1	Geltoli	LPHD. Geltoli	Yohana Tatepa	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
136	3	Sailal	LD. Sailal	Tarsi Yempormase	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
137	3	Wayafli	LD. Wayafli	Lukas Feplun	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
138	1	Bicoli	LPHD. Bicoli	Faruk Hi. Syamsi	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
139	1	Waci	LPHD. Waci	Habibu Salatun	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
140	1	Wasileo	LPHD. Wasileo	Kifli Aramin	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
141	3	Lolobata	LD. Lolobata	Abdurrahman Patola	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
142	3	Aer Salobar	LD. Aer Salobar	Lasadi Jamali	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
143	3	Damuli	LD. Damuli	Rijali Daud	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
144	3	Dotte	LD. Dotte	Salamudin Usman	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
145	3	Masure	LD. Masure	Jamaluddin Talib	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
146	3	Nursifa	LD. Nursifa	Wan Hi. Sanana	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
147	3	Peniti	LD. Peniti	Setiawan Hi. Musa	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
148	3	Sakam	LD. Sakam	Irnando Darto	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
149	2	Baily Bersatu	KTH. Baily Bersatu	Jubair Saleh	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
150	1	Kluting Jaya	LPHD. Kluting Jaya	Muhammad Samad	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
151	3	Bobane Bersama	LD. Bobane Bersama	Jurnawil Basir	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
152	1	Kobe	LPHD. Kobe	Sefnat Jangu	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
153	1	Kulo Jaya	LPHD. Kulo Jaya	Albert Koke	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
154	3	Lembah Asri	LD. Lembah Asri	Salim Muhammad	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
155	3	Moreala	LD. Moreala	Tajir Lasimu	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
156	3	Nusliko	LD. Nusliko	Zakarias Karendaheng	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
157	3	Sosowomo	LD. Sosowomo	Melyon Hatari	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
158	3	Sumber Sari	LD. Sumber Sari	Bahtiar Sarif	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
159	3	Tilope	LD. Tilope	Remus Tamanentang	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
160	3	Wairoro Indah	LD. Wairoro Indah	Burhanudin Yusuf	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
161	1	Were	LPHD. Were	Sulfi Yuli	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
162	3	Yeke	LD. Yeke	Yustap Padene	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
163	3	Balitata	LD. Balitata	Sahrun Yusuf	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
164	1	Bibinoi	LPHD. Bibinoi	Ansar Ditty	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
165	2	Gandasuli Makmur	KTH. Gandasuli Makmur	La Udin La Jifu	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
166	2	Gunung Basudara	KTH. Gunung Basudara	Hamis La Rahila	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
167	1	Kampung Makian 	LPHD. Kampung Makian 	Abubakar Malagapi	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
168	1	Songa	LPHD. Songa	Yanes Pangasaten	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
169	1	Wayamiga	LPHD. Wayamiga	Syamsudin Hasan	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
170	3	Oha	LD. Oha	Amin Sabtu	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
171	3	Amominye	LD. Amominye	Ikbal Kamisi	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
172	3	Ene Lo Ene	LD. Ene Lo Ene	Ridwan A. Mahmud	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
173	3	Fakati Amo	LD. Fakati Amo	Ahmad Asari	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
174	3	Mateketen	LD. Mateketen	Muhlis Hanafi	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
175	3	Papaceda	LD. Papaceda	Bilal Bisnu	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
176	3	Saketa	LD. Saketa	Hartono Sabtu	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
177	3	Tabamasa	LD. Tabamasa	Salamat Saibi	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
178	3	Tegono	LD. Tegono	Rustam S. Muhammad	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
179	3	Tobuku	LD. Tobuku	Jahir Harun	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
180	1	Marabose	LPHD. Marabose	Sahril Hata	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
181	4	Perkebunan Bacan Lippu Mandiri	Koperasi Perkebunan Bacan Lippu Mandiri	-	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
182	5	Pogorio	KT. Pogorio	Masroni Kasman	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
183	5	Putra Canga	KT. Putra Canga	Amrin F. Abbas	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
184	5	Sayoang Marahai	KT. Sayoang Marahai	Jhoni Matoro	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
185	5	Teluk Belang-Belang	KT. Teluk Belang-Belang	Sabtu Lahwarin	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
186	5	Tuada	KT. Tuada	Mukmin Nasarudin	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
187	1	Baleha	LPHD. Baleha	\N	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
188	1	Futawa	LPHD. Futawa	AWALIDUIN PANIGFAT	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
189	1	Sama	LPHD. Sama	\N	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
190	1	Waigoiyofa	LPHD. Waigoiyofa	MIDING BANAPON	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
191	1	Bega	LPHD. Bega	Junaidi Buamona	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
192	1	Fat Iba	LPHD. Fat Iba	Marjan Usia	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
193	1	Fatkauyon	LPHD. Fatkauyon	A. Samad Drakel	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
194	1	Fogi	LPHD. Fogi	Ajmin Wambes	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
195	1	Kabau Darat	LPHD. Kabau Darat	Harun Kedafota	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
196	1	Manaf	LPHD. Manaf	Adi Teapon	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
197	1	Naflow	LPHD. Naflow	Sahrudin Liamanu	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
198	1	Nahi	LPHD. Nahi	Afu Umafagur	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
199	1	Ona	LPHD. Ona	Adino Samak	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
200	3	Pastina	LD. Pastina	Fardi Makean	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
201	3	Pohea	LD. Pohea	Mohtar Duwila	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
202	1	Sekom	LPHD. Sekom	Naim Sangadji	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
203	1	Soamole	LPHD. Soamole	Darwis Umamit	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
204	1	Wai Ina	LPHD. Wai Ina	Burhan Umasugi	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
205	1	Wai Ipa	LPHD. Wai Ipa	Usman Buamona	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
206	1	Waiboga	LPHD. Waiboga	Sahlan Teapon	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
207	1	Waigay	LPHD. Waigay	Ali Mudin Leko	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
208	3	Waihama	LD. Waihama	Hayun Yoisangaji	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
209	1	Wailau	LPHD. Wailau	Sarbanun Fataruba	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
210	1	Waiman	LPHD. Waiman	Kasman Umanahu	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
211	1	Wainib	LPHD. Wainib	Damra Umakaapa	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
212	1	Waitina	LPHD. Waitina	Imran Umawaitina	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
213	3	Fukweu	LD. Fukweu	Dahlan Duwila	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
214	3	Umaloya	LD. Umaloya	Sirahim Umalekhoa	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
215	3	Fokalik	LD. Fokalik	Safrudin Umage	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
216	3	Kawata	LD. Kawata	Jainudin Umasugi	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
217	3	Paratina	LD. Paratina	Umar Gay	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
218	1	Kabau Pantai	LPHD. Kabau Pantai	Muid Lidamona	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
219	1	Kou	LPHD. Kou	Nadir Teapon	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
220	1	Wailia	LPHD. Wailia	Jahruddin Norau	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
221	3	Wainin	LD. Wainin	Darwan Umamit	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
222	1	Parigi Samaturu	LPHD. Parigi Samaturu	Alham Ridwan	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
223	1	Tubang Permai	LPHD. Tubang Permai	Said Tamimi	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
224	1	Samuya	LPHD. Samuya	Alham Ridwan	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
225	1	Kenari	LPHD. Kenari	Darwin Seng	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
226	1	Lusuo	LPHD. Lusuo	NIANG BIDUL	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
227	1	Tawakali	LPHD. Tawakali	JUBLINA SIORI	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
228	1	Bido	LPHD. Bido	Herto Mala	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
229	1	Cendana 	LPHD. Cendana 	Antonius Tenang	t	KPS	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
230	1	Gorua	LPHD. Gorua	Musdi Ano	t	KPS	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
231	1	Sininga Moi	LPHD. Sininga Moi	Ramjan Banyo	t	KPS	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
232	1	Tutuhu 	LPHD. Tutuhu 	Frans Baba	t	KPS	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
233	1	Wewemo	LPHD. Wewemo	Najib Lanoko	t	KPS	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
234	3	Morodai	LD. Morodai	Abd. Haris Tjan	t	KUPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
235	3	Aru	LD. Aru	Marlen Haruna	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
236	3	Gorugo	LD. Gorugo	Sefrol Tatontos	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
237	3	Korago	LD. Korago	Sisko Dara	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
238	3	Towara	LD. Towara	Mipsar Haumadi	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
239	3	Anggrek Wayabula	LD. Anggrek Wayabula	Samsul Gugutu	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
240	2	Gapoktan Boku	KTH. Gapoktan Boku	Rustam Rahim	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
241	3	Gosora	LD. Gosora	Owen M. Ube	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
242	1	Marimoi	LPHD. Marimoi	Asur Tajibu	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
243	3	Nakamura	LD. Nakamura	Anhar Dopo	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
244	3	Ngele-Ngele	LD. Ngele-Ngele	Abdillah Sibua	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
245	4	Nurul Simal	Koperasi Nurul Simal	-	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
246	3	Raja	LD. Raja	Yedit Papangge	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
247	3	Yao	LD. Yao	Meksen Mala	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
248	1	Ulo	LPHD. Ulo	Urbanus Arba	t	KPS	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
249	3	Adu	LD. Adu	Waldus Kader	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
250	1	Tataleka	LPHD. Tataleka	Tu Saban	t	KUPS	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
251	3	Baru	LD. Baru	Obetnego Dedene	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
252	3	Idamdehe Gamsungi	LD. Idamdehe Gamsungi	Efraim Ngutji	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
253	3	Porniti	LD. Porniti	Alexander Lifu, S.Th	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
254	1	Pasalulu	LPHD. Pasalulu	Hendrik Kamisi	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
255	1	Kahatola	LPHD. Kahatola	Arit Tjina	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
256	3	Tibobo	LD. Tibobo	Dedi Rano	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
257	3	Akelaha	LD. Akelaha	La Ode Ilahi	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
258	3	Sidangoli Dehe	LD. Sidangoli Dehe	Ahmad Syamsi	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
259	1	Tuada	LPHD. Tuada	Mukmin Nasarudin	t	2024	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
260	2	Gam Wanger	KTH. Gam Wanger	Enos Mole	t	KUPS	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
261	3	Matui	LD. Matui	Sugianto A. Mahmud	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
262	1	Payo	LPHD. Payo	Isra H. Sahiba	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
263	2	Mariolaha	KTH. Mariolaha	Djidon Kay	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
264	3	Sasur	LD. Sasur	Darwin Kiatjili	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
265	3	Rioribati	LD. Rioribati	Petrus Dibang	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
266	3	Naga	LD. Naga	Boel Herus	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
267	3	Gamsida	LD. Gamsida	Gerson Guduru	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
268	1	Tolisaor	LPHD. Tolisaor	Marmon Tuluino	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
269	3	Tetewang Joronga	LD. Tetewang Joronga	Pasianus Punene	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
270	3	Jano	LD. Jano	Dewikson Gongua	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
271	3	Maritango	LD. Maritango	Yosner Bobangu	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
272	2	Hijrah	KTH. Hijrah	Fahri Limatahu	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
273	3	Salahum	LD. Salahum	Mefal Kundiman	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
274	3	Tasye	LD. Tasye	Asriel Natte	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
275	3	Tuguis	LD. Tuguis	Reyn Nyanyi	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
276	3	Bakun Pantai	LD. Bakun Pantai	Yoel Mohibu	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
277	3	Barataku	LD. Barataku	Apson Hasang	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
278	3	Gamkahe	LD. Gamkahe	Jefri Batui	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
279	3	Pumadada	LD. Pumadada	Ayub Dadare	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
280	3	Tosomolo	LD. Tosomolo	Miler Punana	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
281	3	Aru Jaya	LD. Aru Jaya	Eros Arah	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
282	3	Togereba Sungi	LD. Togereba Sungi	Yosep Ugu	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
283	3	Tuguraci	LD. Tuguraci	Honto Puni	t	Belum	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
284	3	Jere	LD. Jere	Hendris Lau	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
285	1	Bobanehena	LPHD. Bobanehena	Iswandi Umasangaji	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
286	1	Idam Dehe	LPHD. Idam Dehe	Amrozius Djumaty	t	KPS	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
287	2	Karya Sahu	KTH. Karya Sahu	Agus Molle	t	KPS	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
288	2	Sarawiata	KTH. Sarawiata	Yotam Roda	t	KPS	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
289	2	Talaga Dalam	KTH. Talaga Dalam	Salasa Tari	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
290	3	Nanas	LD. Nanas	Marson Tobelo	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
291	2	Mao Sigaro	KTH. Mao Sigaro	Paulus Papu	t	KUPS	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
292	1	Campaka	LPHD. Campaka	Missy Lisa	t	KUPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
293	2	Wolo Ma Dowar	KTH. Wolo Ma Dowar	Andarias Katty	t	KUPS	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
294	3	Sukadamai	LD. Sukadamai	Ahmad Manekin	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
295	3	Kie Ici	LD. Kie Ici	Liswan Laka	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
296	3	Ngalo-Ngalo	LD. Ngalo-Ngalo	Mardin Waery	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
297	3	Ngawet	LD. Ngawet	Simson Pita	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
298	3	Sarau	LD. Sarau	Simson Pitta	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
299	1	Tabobol	LPHD. Tabobol	Marianto Mayau	t	KPS	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
300	1	Tosoa	LPHD. Tosoa	Richard Massang	t	KUPS	t	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
301	1	Borona	LPHD. Borona	Martianus Ugu	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
302	1	Togereba Tua	LPHD. Togereba Tua	Zakeus Midjoro	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
303	3	Akediri	LD. Akediri	Yodafit N. Korois	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
304	2	Cigi'Awa	KTH. Cigi'Awa	Amon Lesa	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
305	3	Bukumatiti	LD. Bukumatiti	Oktaferus Baura	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
306	3	Tauro	LD. Tauro	Georgen Momone	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
307	3	Todowongi	LD. Todowongi	Markrius Aha	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
308	3	Akeara	LD. Akeara	Hongken Salaka	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
309	2	Maku Sonyinga	KTH. Maku Sonyinga	Siraju Ningkeula	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
310	3	Bangkit Rahmat	LD. Bangkit Rahmat	Husen Gaus	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
311	3	Domato	LD. Domato	Nofristo Sarangati	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
312	3	Pesona Braha	LD. Pesona Braha	Samarkandi Malawa	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
313	3	Tabadamai	LD. Tabadamai	Kadhan Mandar	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
314	3	Tewe	LD. Tewe	Djidon Akelou	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
315	3	Akelamo Kao	LD. Akelamo Kao	Iswan Madjid	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
316	4	Rian Pratama Lestari	Koperasi. Rian Pratama Lestari	-	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
317	3	Akesahu	LD. Akesahu	Markarius Arisa	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
318	3	Bobaneigo	LD. Bobaneigo	Achmad Amin	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
319	1	Laba Besar 	LPHD. Laba Besar 	Agustinus Ngongano	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
320	1	Laba Kecil	LPHD. Laba Kecil	Yairus Siom	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
321	3	Tuguis	LD. Tuguis	Saskar Doiniki	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
322	3	Balisoan Utara	LD. Balisoan Utara	Djeisson Nyong	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
323	3	Dere	LD. Dere	Alkin Appa	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
324	3	Goro-Goro	LD. Goro-Goro	Otniel Mai	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
325	3	Sasur Pantai	LD. Sasur Pantai	Williyam Sipolo	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
326	3	Taraudu	LD. Taraudu	Permenas Nona	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
327	3	Awer	LD. Awer	Elias Dikson Takome	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
328	3	Aketola	LD. Aketola	Keken Inri	t	\N	f	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
\.


--
-- Data for Name: LandCoverTypes; Type: TABLE DATA; Schema: public; Owner: hutan_kita_user
--

COPY public."LandCoverTypes" (id, code, name, description, "createdAt", "updatedAt") FROM stdin;
1	HK1	Hutan Lahan Kering Primer	\N	2026-02-16 02:40:43.413+07	2026-02-16 02:40:43.413+07
2	HK2	Hutan Lahan Kering Sekunder	\N	2026-02-16 02:40:43.426+07	2026-02-16 02:40:43.426+07
3	PL	Pertanian Lahan Kering	\N	2026-02-16 02:40:43.429+07	2026-02-16 02:40:43.429+07
4	SB	Semak Belukar	\N	2026-02-16 02:40:43.43+07	2026-02-16 02:40:43.43+07
5	KB	Perkebunan	\N	2026-02-16 02:40:43.432+07	2026-02-16 02:40:43.432+07
\.


--
-- Data for Name: MarketData; Type: TABLE DATA; Schema: public; Owner: hutan_kita_user
--

COPY public."MarketData" (id, "commodityId", "permitId", "buyerId", "localPrice", "nationalPrice", "priceUnit", "absorptionVolume", "absorptionUnit", "logisticCost", "hasExportPotential", "hasRegularBuyer", "yearRecorded", "createdAt", "updatedAt") FROM stdin;
1	13	1	2	39504.45	19690.71	Kg	780.06	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.617+07	2026-02-16 02:40:43.617+07
2	46	2	4	14675.83	34997.71	Kg	534.27	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.632+07	2026-02-16 02:40:43.632+07
3	9	3	2	48249.14	28079.08	Kg	772.31	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.641+07	2026-02-16 02:40:43.641+07
4	116	4	3	57727.32	28042.80	Kg	709.35	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.649+07	2026-02-16 02:40:43.649+07
5	112	5	4	36082.80	44657.25	Kg	386.03	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.658+07	2026-02-16 02:40:43.658+07
6	113	6	3	29786.70	42723.86	Kg	242.61	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.666+07	2026-02-16 02:40:43.666+07
7	127	7	1	50193.85	21213.58	Kg	449.17	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.675+07	2026-02-16 02:40:43.675+07
8	67	8	2	47578.01	40613.88	Kg	983.62	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.682+07	2026-02-16 02:40:43.682+07
9	15	9	2	40668.99	18526.23	Kg	356.37	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.69+07	2026-02-16 02:40:43.69+07
10	86	10	3	45270.11	30504.31	Kg	643.97	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.696+07	2026-02-16 02:40:43.696+07
11	29	11	3	12448.67	61864.05	Kg	456.13	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.704+07	2026-02-16 02:40:43.704+07
12	118	12	4	15715.29	19297.17	Kg	488.43	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.71+07	2026-02-16 02:40:43.71+07
13	76	13	4	21816.70	17381.75	Kg	50.52	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.717+07	2026-02-16 02:40:43.717+07
14	125	14	4	16682.67	62779.13	Kg	658.75	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.725+07	2026-02-16 02:40:43.725+07
15	113	15	5	41318.02	41754.12	Kg	0.81	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.731+07	2026-02-16 02:40:43.731+07
16	80	16	5	57514.86	22785.30	Kg	425.25	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.739+07	2026-02-16 02:40:43.739+07
17	39	17	2	23995.92	48997.21	Kg	408.16	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.745+07	2026-02-16 02:40:43.745+07
18	112	18	3	22290.91	29171.79	Kg	172.62	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.751+07	2026-02-16 02:40:43.751+07
19	18	19	5	10919.48	33127.85	Kg	726.94	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.758+07	2026-02-16 02:40:43.758+07
20	131	20	3	54118.11	42649.57	Kg	378.25	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.763+07	2026-02-16 02:40:43.763+07
21	142	21	4	24964.11	62250.27	Kg	659.29	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.769+07	2026-02-16 02:40:43.769+07
22	132	22	5	52161.99	42730.10	Kg	665.01	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.776+07	2026-02-16 02:40:43.776+07
23	58	23	4	52448.23	17749.42	Kg	40.05	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.782+07	2026-02-16 02:40:43.782+07
24	39	24	5	25714.88	37261.40	Kg	227.07	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.792+07	2026-02-16 02:40:43.792+07
25	95	25	5	35310.97	22576.34	Kg	132.00	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.798+07	2026-02-16 02:40:43.798+07
26	12	26	5	59881.32	30965.76	Kg	109.29	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.805+07	2026-02-16 02:40:43.805+07
27	118	27	2	38937.23	21859.55	Kg	301.63	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.812+07	2026-02-16 02:40:43.812+07
28	75	28	4	36280.84	52561.43	Kg	74.11	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.819+07	2026-02-16 02:40:43.819+07
29	73	29	5	25224.48	51024.49	Kg	899.94	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.826+07	2026-02-16 02:40:43.826+07
30	85	30	4	55375.40	61118.51	Kg	478.08	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.832+07	2026-02-16 02:40:43.832+07
31	54	31	5	36651.91	58102.06	Kg	140.92	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.841+07	2026-02-16 02:40:43.841+07
32	103	32	3	23954.21	57941.05	Kg	902.85	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.847+07	2026-02-16 02:40:43.847+07
33	38	33	2	25743.03	26539.72	Kg	942.77	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.854+07	2026-02-16 02:40:43.854+07
34	62	34	1	15228.40	52905.01	Kg	590.42	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.861+07	2026-02-16 02:40:43.861+07
35	73	35	5	56748.84	32667.13	Kg	522.32	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.867+07	2026-02-16 02:40:43.867+07
36	111	36	4	55442.18	58320.07	Kg	980.83	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.874+07	2026-02-16 02:40:43.874+07
37	67	37	1	32275.55	38115.86	Kg	0.94	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.881+07	2026-02-16 02:40:43.881+07
38	66	38	3	30482.15	46691.44	Kg	221.72	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.888+07	2026-02-16 02:40:43.888+07
39	103	39	4	10280.26	61799.57	Kg	644.57	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.894+07	2026-02-16 02:40:43.894+07
40	81	40	2	16448.93	44405.49	Kg	206.71	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.9+07	2026-02-16 02:40:43.9+07
41	29	41	3	11720.81	26210.03	Kg	494.16	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.908+07	2026-02-16 02:40:43.908+07
42	33	42	3	29743.80	27906.32	Kg	795.17	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.913+07	2026-02-16 02:40:43.913+07
43	71	43	4	28992.62	18849.84	Kg	607.42	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.92+07	2026-02-16 02:40:43.92+07
44	38	44	5	11264.62	62445.58	Kg	489.80	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.926+07	2026-02-16 02:40:43.926+07
45	46	45	5	18101.69	48171.27	Kg	262.55	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.933+07	2026-02-16 02:40:43.933+07
46	20	46	5	58384.51	26178.16	Kg	412.52	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.94+07	2026-02-16 02:40:43.94+07
47	90	47	2	20204.62	45977.78	Kg	999.88	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.946+07	2026-02-16 02:40:43.946+07
48	5	48	3	25870.78	55647.88	Kg	97.66	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.953+07	2026-02-16 02:40:43.953+07
49	127	49	2	42504.54	30658.35	Kg	973.01	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.959+07	2026-02-16 02:40:43.959+07
50	3	50	2	13328.85	30973.59	Kg	908.93	Ton/Tahun	\N	f	f	2024	2026-02-16 02:40:43.966+07	2026-02-16 02:40:43.966+07
\.


--
-- Data for Name: MonitoringLogs; Type: TABLE DATA; Schema: public; Owner: hutan_kita_user
--

COPY public."MonitoringLogs" (id, "permitId", "monitorType", "monitorDate", findings, recommendations, "officerName", photos, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: PSSchemes; Type: TABLE DATA; Schema: public; Owner: hutan_kita_user
--

COPY public."PSSchemes" (id, code, name, description, "createdAt", "updatedAt") FROM stdin;
1	HD	HD	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
2	HKm	HKm	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
3	HTR	HTR	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
4	HA	HA	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
5	Kulin KK	Kulin KK	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
6	IPHPS	IPHPS	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
\.


--
-- Data for Name: PermitCommodities; Type: TABLE DATA; Schema: public; Owner: hutan_kita_user
--

COPY public."PermitCommodities" (id, "permitId", "commodityId", "isPrimary", "productionQty", "productionUnit", notes, "createdAt", "updatedAt") FROM stdin;
1	1	1	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
2	10	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
3	10	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
4	10	4	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
5	10	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
6	10	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
7	10	7	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
8	11	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
9	11	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
10	11	9	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
11	11	10	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
12	13	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
13	13	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
14	13	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
15	13	12	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
16	13	13	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
17	13	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
18	13	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
19	13	14	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
20	13	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
21	13	15	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
22	14	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
23	14	9	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
24	14	16	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
25	14	17	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
26	15	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
27	15	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
28	15	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
29	15	12	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
30	15	13	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
31	15	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
32	15	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
33	15	14	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
34	15	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
35	15	15	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
36	18	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
37	18	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
38	18	18	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
39	18	19	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
40	18	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
41	19	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
42	19	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
43	19	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
44	19	17	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
45	20	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
46	20	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
47	20	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
48	20	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
49	21	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
50	21	17	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
51	22	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
52	22	17	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
53	23	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
54	23	20	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
55	23	17	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
56	24	21	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
57	24	22	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
58	24	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
59	24	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
60	24	23	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
61	24	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
62	24	12	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
63	24	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
64	24	14	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
65	24	10	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
66	25	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
67	25	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
68	25	12	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
69	26	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
70	26	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
71	26	13	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
72	26	24	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
73	26	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
74	26	25	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
75	27	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
76	27	26	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
77	27	27	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
78	27	28	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
79	27	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
80	27	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
81	28	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
82	28	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
83	28	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
84	28	29	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
85	28	30	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
86	28	31	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
87	28	32	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
88	28	33	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
89	29	21	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
90	29	34	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
91	29	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
92	29	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
93	29	24	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
94	29	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
95	29	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
96	29	35	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
97	30	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
98	30	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
99	30	36	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
100	30	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
101	30	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
102	31	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
103	31	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
104	31	37	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
105	31	38	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
106	31	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
107	31	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
108	31	39	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
109	32	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
110	32	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
111	32	27	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
112	35	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
113	35	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
114	35	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
115	35	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
116	36	40	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
117	36	41	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
118	36	42	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
119	36	43	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
120	36	21	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
121	36	44	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
122	36	45	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
123	36	46	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
124	36	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
125	36	22	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
126	36	47	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
127	36	48	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
128	36	20	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
129	36	49	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
130	36	50	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
131	36	51	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
132	36	23	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
133	38	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
134	38	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
135	38	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
136	39	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
137	39	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
138	39	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
139	39	52	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
140	40	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
141	40	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
142	40	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
143	42	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
144	42	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
145	42	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
146	44	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
147	44	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
148	44	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
149	44	53	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
150	53	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
151	53	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
152	53	14	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
153	53	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
154	54	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
155	54	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
156	54	14	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
157	54	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
158	54	10	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
159	55	54	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
160	55	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
161	55	44	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
162	55	55	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
163	55	47	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
164	55	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
165	56	55	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
166	56	54	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
167	56	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
168	56	44	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
169	57	4	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
170	57	10	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
171	58	42	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
172	58	44	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
173	58	43	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
174	58	22	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
175	58	41	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
176	58	56	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
177	58	21	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
178	58	45	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
179	58	57	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
180	58	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
181	58	55	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
182	58	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
183	58	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
184	58	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
185	58	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
186	59	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
187	59	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
188	59	58	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
189	59	59	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
190	59	44	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
191	59	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
192	59	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
193	60	21	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
194	60	60	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
195	60	22	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
196	60	44	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
197	60	61	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
198	60	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
199	61	34	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
200	61	24	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
201	61	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
202	61	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
203	64	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
204	64	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
205	64	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
206	64	54	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
207	64	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
208	64	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
209	64	62	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
210	65	63	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
211	65	42	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
212	65	43	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
213	65	21	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
214	65	44	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
215	65	45	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
216	65	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
217	65	22	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
218	66	24	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
219	66	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
220	66	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
221	67	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
222	67	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
223	67	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
224	67	24	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
225	67	14	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
226	67	54	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
227	67	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
228	69	24	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
229	69	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
230	70	24	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
231	70	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
232	70	20	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
233	70	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
234	70	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
235	71	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
236	71	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
237	71	21	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
238	71	44	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
239	71	64	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
240	71	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
241	71	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
242	71	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
243	72	55	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
244	73	55	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
245	73	54	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
246	73	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
247	73	44	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
248	74	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
249	74	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
250	74	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
251	74	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
252	74	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
253	74	65	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
254	74	54	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
255	75	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
256	75	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
257	75	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
258	75	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
259	75	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
260	75	65	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
261	75	54	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
262	75	20	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
263	75	40	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
264	75	66	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
265	76	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
266	76	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
267	76	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
268	76	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
269	76	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
270	76	14	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
271	76	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
272	77	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
273	77	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
274	77	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
275	77	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
276	77	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
277	77	65	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
278	77	54	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
279	78	42	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
280	78	60	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
281	78	22	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
282	78	67	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
283	78	68	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
284	78	69	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
285	78	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
286	78	23	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
287	78	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
288	78	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
289	78	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
290	78	70	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
291	79	42	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
292	79	44	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
293	79	43	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
294	79	22	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
295	79	41	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
296	79	56	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
297	79	21	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
298	79	45	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
299	79	57	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
300	79	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
301	79	55	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
302	79	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
303	79	62	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
304	79	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
305	79	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
306	79	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
307	92	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
308	92	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
309	92	21	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
310	92	71	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
311	92	43	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
312	92	44	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
313	92	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
314	92	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
315	92	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
316	94	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
317	94	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
318	94	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
319	95	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
320	95	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
321	95	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
322	96	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
323	96	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
324	96	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
325	99	14	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
326	99	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
327	99	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
328	99	72	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
329	102	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
330	102	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
331	102	58	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
332	102	59	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
333	102	44	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
334	102	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
335	102	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
336	103	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
337	103	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
338	103	58	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
339	103	59	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
340	103	44	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
341	103	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
342	103	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
343	104	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
344	104	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
345	104	58	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
346	104	59	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
347	104	44	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
348	104	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
349	104	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
350	105	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
351	105	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
352	105	58	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
353	105	59	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
354	105	44	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
355	105	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
356	105	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
357	106	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
358	106	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
359	106	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
360	106	73	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
361	123	74	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
362	124	42	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
363	124	43	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
364	124	21	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
365	124	44	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
366	124	45	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
367	124	60	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
368	124	47	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
369	124	22	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
370	124	75	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
371	124	23	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
372	124	49	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
373	124	20	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
374	124	76	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
375	125	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
376	125	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
377	125	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
378	125	46	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
379	125	21	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
380	125	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
381	125	9	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
382	125	77	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
383	126	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
384	126	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
385	126	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
386	126	46	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
387	126	21	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
388	126	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
389	126	9	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
390	126	77	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
391	127	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
392	127	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
393	127	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
394	127	46	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
395	127	21	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
396	127	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
397	127	9	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
398	127	77	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
399	128	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
400	128	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
401	128	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
402	128	46	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
403	128	21	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
404	128	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
405	128	9	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
406	128	77	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
407	129	10	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
408	129	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
409	129	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
410	129	77	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
411	130	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
412	130	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
413	130	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
414	130	55	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
415	130	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
416	130	20	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
417	130	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
418	131	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
419	131	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
420	131	54	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
421	131	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
422	131	20	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
423	131	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
424	131	78	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
425	131	79	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
426	132	10	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
427	132	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
428	132	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
429	132	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
430	132	80	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
431	132	81	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
432	135	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
433	135	66	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
434	135	60	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
435	135	47	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
436	135	64	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
437	135	9	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
438	135	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
439	135	24	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
440	135	23	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
441	135	82	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
442	138	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
443	138	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
444	138	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
445	138	83	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
446	138	55	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
447	138	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
448	138	84	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
449	138	14	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
450	138	85	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
451	138	86	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
452	138	10	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
453	139	10	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
454	139	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
455	139	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
456	139	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
457	139	83	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
458	139	27	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
459	140	10	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
460	141	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
461	141	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
462	141	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
463	141	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
464	141	87	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
465	149	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
466	149	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
467	149	23	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
468	150	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
469	150	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
470	150	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
471	150	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
472	150	17	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
473	152	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
474	152	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
475	152	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
476	152	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
477	152	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
478	152	20	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
479	152	17	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
480	152	10	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
481	153	42	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
482	153	44	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
483	153	46	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
484	153	22	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
485	153	41	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
486	153	56	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
487	153	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
488	153	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
489	153	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
490	161	17	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
491	161	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
492	161	20	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
493	162	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
494	162	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
495	162	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
496	162	23	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
497	162	88	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
498	164	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
499	164	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
500	164	15	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
501	164	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
502	164	20	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
503	164	89	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
504	164	10	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
505	164	17	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
506	165	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
507	165	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
508	165	15	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
509	165	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
510	165	20	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
511	165	89	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
512	165	10	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
513	166	43	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
514	166	45	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
515	166	24	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
516	166	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
517	166	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
518	166	15	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
519	166	90	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
520	166	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
521	166	60	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
522	166	56	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
523	166	28	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
524	166	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
525	167	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
526	167	15	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
527	167	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
528	167	20	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
529	167	89	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
530	168	17	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
531	168	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
532	168	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
533	168	15	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
534	168	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
535	168	55	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
536	168	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
537	168	14	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
538	169	17	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
539	169	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
540	169	55	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
541	169	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
542	180	17	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
543	180	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
544	180	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
545	180	15	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
546	180	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
547	180	55	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
548	180	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
549	180	14	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
550	182	20	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
551	182	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
552	182	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
553	182	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
554	182	14	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
555	183	10	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
556	183	91	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
557	183	92	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
558	184	20	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
559	184	54	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
560	184	78	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
561	184	83	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
562	184	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
563	184	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
564	185	20	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
565	185	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
566	185	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
567	185	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
568	186	93	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
569	186	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
570	186	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
571	186	14	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
572	186	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
573	186	94	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
574	191	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
575	191	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
576	191	95	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
577	191	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
578	191	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
579	191	17	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
580	192	43	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
581	192	40	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
582	192	66	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
583	192	58	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
584	192	96	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
585	192	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
586	192	83	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
587	192	95	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
588	193	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
589	193	52	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
590	193	17	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
591	194	64	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
592	194	60	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
593	194	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
594	194	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
595	194	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
596	194	14	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
597	194	42	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
598	194	97	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
599	195	17	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
600	195	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
601	195	77	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
602	196	43	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
603	196	22	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
604	196	98	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
605	196	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
606	196	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
607	196	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
608	196	99	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
609	196	83	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
610	197	83	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
611	197	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
612	197	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
613	197	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
614	197	24	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
615	197	52	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
616	197	17	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
617	198	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
618	198	77	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
619	198	17	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
620	199	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
621	199	77	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
622	199	17	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
623	200	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
624	200	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
625	200	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
626	200	100	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
627	200	95	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
628	200	54	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
629	200	78	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
630	200	79	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
631	200	58	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
632	200	40	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
633	200	42	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
634	200	60	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
635	200	50	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
636	200	101	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
637	201	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
638	201	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
639	201	62	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
640	201	101	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
641	201	102	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
642	202	43	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
643	202	40	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
644	202	58	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
645	202	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
646	202	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
647	202	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
648	202	99	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
649	202	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
650	203	43	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
651	203	60	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
652	203	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
653	203	14	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
654	203	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
655	203	44	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
656	203	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
657	203	99	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
658	203	83	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
659	203	28	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
660	203	103	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
661	204	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
662	204	77	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
663	204	17	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
664	205	43	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
665	205	40	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
666	205	44	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
667	205	66	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
668	205	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
669	205	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
670	205	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
671	205	99	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
672	206	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
673	206	83	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
674	206	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
675	206	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
676	206	17	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
677	207	43	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
678	207	40	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
679	207	44	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
680	207	98	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
681	207	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
682	207	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
683	207	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
684	207	77	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
685	207	83	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
686	207	99	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
687	208	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
688	208	95	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
689	208	55	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
690	208	65	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
691	208	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
692	208	101	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
693	208	104	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
694	209	42	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
695	209	45	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
696	209	60	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
697	209	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
698	209	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
699	209	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
700	209	14	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
701	210	43	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
702	210	40	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
703	210	105	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
704	210	106	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
705	210	66	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
706	210	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
707	210	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
708	210	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
709	210	99	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
710	210	107	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
711	210	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
712	211	43	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
713	211	44	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
714	211	66	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
715	211	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
716	211	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
717	211	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
718	211	99	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
719	212	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
720	212	52	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
721	212	24	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
722	212	10	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
723	218	17	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
724	218	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
725	218	77	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
726	219	73	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
727	219	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
728	219	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
729	219	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
730	219	52	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
731	219	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
732	220	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
733	220	77	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
734	220	17	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
735	222	21	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
736	222	64	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
737	222	58	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
738	222	43	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
739	222	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
740	222	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
741	222	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
742	222	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
743	223	21	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
744	223	58	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
745	223	43	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
746	223	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
747	223	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
748	223	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
749	223	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
750	224	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
751	224	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
752	224	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
753	224	83	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
754	228	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
755	228	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
756	228	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
757	229	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
758	229	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
759	229	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
760	230	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
761	230	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
762	230	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
763	230	21	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
764	230	34	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
765	231	40	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
766	231	23	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
767	231	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
768	231	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
769	231	22	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
770	231	56	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
771	231	108	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
772	231	41	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
773	231	109	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
774	231	110	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
775	231	66	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
776	231	42	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
777	231	75	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
778	231	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
779	231	20	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
780	232	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
781	232	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
782	232	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
783	233	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
784	233	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
785	233	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
786	233	12	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
787	233	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
788	234	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
789	234	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
790	234	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
791	234	20	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
792	234	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
793	234	111	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
794	239	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
795	239	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
796	239	30	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
797	239	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
798	239	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
799	240	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
800	240	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
801	240	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
802	240	20	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
803	240	54	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
804	240	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
805	241	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
806	241	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
807	241	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
808	241	20	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
809	241	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
810	241	112	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
811	242	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
812	242	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
813	242	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
814	242	84	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
815	242	12	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
816	242	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
817	247	20	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
818	247	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
819	247	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
820	247	54	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
821	247	62	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
822	248	42	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
823	248	43	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
824	248	21	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
825	248	44	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
826	248	45	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
827	248	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
828	248	22	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
829	249	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
830	249	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
831	249	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
832	249	65	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
833	249	24	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
834	249	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
835	250	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
836	250	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
837	251	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
838	251	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
839	251	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
840	252	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
841	252	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
842	252	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
843	252	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
844	252	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
845	253	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
846	253	113	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
847	253	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
848	253	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
849	253	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
850	254	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
851	254	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
852	254	30	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
853	254	114	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
854	254	115	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
855	254	116	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
856	254	117	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
857	254	118	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
858	254	119	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
859	255	17	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
860	255	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
861	255	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
862	255	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
863	255	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
864	256	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
865	256	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
866	256	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
867	256	113	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
868	256	12	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
869	256	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
870	256	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
871	257	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
872	257	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
873	257	62	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
874	257	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
875	257	54	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
876	258	74	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
877	258	120	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
878	258	121	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
879	258	122	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
880	258	123	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
881	258	124	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
882	259	42	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
883	259	43	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
884	259	21	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
885	259	44	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
886	259	45	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
887	259	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
888	259	22	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
889	261	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
890	261	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
891	261	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
892	261	83	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
893	261	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
894	262	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
895	262	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
896	262	58	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
897	262	59	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
898	262	44	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
899	262	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
900	262	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
901	262	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
902	263	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
903	263	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
904	263	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
905	263	22	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
906	263	54	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
907	264	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
908	264	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
909	264	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
910	264	22	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
911	264	41	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
912	264	125	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
913	265	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
914	265	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
915	265	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
916	265	54	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
917	265	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
918	265	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
919	266	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
920	266	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
921	266	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
922	267	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
923	267	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
924	267	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
925	267	126	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
926	268	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
927	268	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
928	268	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
929	268	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
930	268	32	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
931	270	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
932	270	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
933	270	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
934	270	22	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
935	270	127	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
936	270	128	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
937	284	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
938	284	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
939	284	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
940	285	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
941	285	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
942	285	58	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
943	285	59	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
944	285	44	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
945	285	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
946	285	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
947	285	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
948	287	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
949	287	55	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
950	288	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
951	288	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
952	288	129	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
953	289	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
954	289	83	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
955	289	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
956	289	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
957	290	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
958	290	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
959	290	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
960	290	128	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
961	292	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
962	292	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
963	292	58	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
964	292	59	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
965	292	44	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
966	292	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
967	292	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
968	293	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
969	295	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
970	295	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
971	295	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
972	295	83	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
973	295	85	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
974	295	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
975	295	12	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
976	295	54	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
977	295	32	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
978	295	118	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
979	295	79	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
980	296	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
981	296	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
982	296	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
983	297	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
984	297	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
985	297	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
986	297	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
987	298	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
988	298	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
989	298	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
990	298	65	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
991	298	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
992	298	128	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
993	299	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
994	299	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
995	299	58	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
996	299	59	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
997	299	44	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
998	299	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
999	299	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1000	299	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1001	301	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1002	301	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1003	301	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1004	301	114	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1005	301	119	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1006	301	118	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1007	302	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1008	302	130	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1009	302	32	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1010	302	131	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1011	302	115	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1012	302	83	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1013	302	14	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1014	302	113	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1015	302	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1016	302	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1017	302	84	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1018	302	118	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1019	302	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1020	303	44	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1021	303	58	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1022	303	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1023	303	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1024	303	54	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1025	303	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1026	303	113	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1027	303	60	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1028	304	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1029	304	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1030	304	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1031	304	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1032	304	12	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1033	304	85	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1034	304	113	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1035	304	14	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1036	304	94	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1037	304	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1038	304	132	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1039	305	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1040	305	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1041	305	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1042	305	62	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1043	305	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1044	306	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1045	306	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1046	306	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1047	306	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1048	306	54	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1049	306	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1050	306	29	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1051	306	84	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1052	306	85	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1053	306	36	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1054	306	133	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1055	306	12	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1056	306	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1057	306	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1058	307	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1059	307	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1060	307	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1061	307	20	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1062	307	77	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1063	307	62	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1064	307	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1065	307	55	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1066	307	134	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1067	308	135	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1068	308	30	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1069	308	73	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1070	308	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1071	308	29	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1072	308	54	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1073	308	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1074	308	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1075	309	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1076	309	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1077	309	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1078	309	136	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1079	310	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1080	310	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1081	310	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1082	310	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1083	311	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1084	311	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1085	311	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1086	311	54	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1087	311	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1088	312	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1089	312	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1090	312	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1091	312	54	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1092	312	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1093	312	29	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1094	312	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1095	312	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1096	312	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1097	312	137	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1098	312	22	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1099	312	60	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1100	312	66	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1101	312	138	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1102	312	139	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1103	313	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1104	313	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1105	313	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1106	313	54	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1107	313	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1108	314	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1109	314	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1110	314	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1111	314	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1112	315	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1113	315	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1114	315	22	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1115	315	140	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1116	315	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1117	315	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1118	315	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1119	316	141	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1120	317	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1121	317	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1122	317	60	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1123	317	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1124	317	12	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1125	317	142	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1126	318	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1127	318	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1128	318	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1129	318	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1130	318	54	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1131	318	30	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1132	319	22	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1133	319	43	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1134	319	42	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1135	319	143	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1136	319	47	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1137	319	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1138	319	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1139	319	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1140	319	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1141	319	77	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1142	320	22	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1143	320	43	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1144	320	42	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1145	320	143	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1146	320	47	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1147	320	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1148	320	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1149	320	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1150	320	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1151	320	77	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1152	321	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1153	321	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1154	321	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1155	321	83	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1156	321	85	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1157	321	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1158	321	12	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1159	321	54	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1160	321	119	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1161	321	32	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1162	321	79	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1163	322	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1164	322	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1165	322	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1166	323	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1167	323	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1168	323	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1169	323	24	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1170	323	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1171	324	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1172	324	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1173	324	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1174	324	128	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1175	325	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1176	325	28	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1177	325	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1178	325	73	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1179	325	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1180	325	22	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1181	326	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1182	326	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1183	326	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1184	326	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1185	326	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1186	326	60	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1187	327	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1188	327	23	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1189	327	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1190	327	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1191	327	3	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1192	327	8	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1193	327	144	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1194	328	2	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1195	328	6	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1196	328	5	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1197	328	43	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1198	328	44	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1199	328	23	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1200	328	11	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1201	328	133	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1202	328	42	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1203	328	22	f	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
\.


--
-- Data for Name: PermitForestStatuses; Type: TABLE DATA; Schema: public; Owner: hutan_kita_user
--

COPY public."PermitForestStatuses" (id, "permitId", "statusId", "createdAt", "updatedAt") FROM stdin;
1	1	6	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
2	2	7	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
3	3	8	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
4	4	9	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
5	5	9	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
6	6	10	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
7	7	11	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
8	8	9	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
9	9	7	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
10	10	12	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
11	11	13	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
12	12	14	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
13	13	12	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
14	14	7	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
15	15	9	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
16	16	9	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
17	17	8	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
18	18	15	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
19	19	16	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
20	20	17	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
21	21	18	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
22	22	19	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
23	23	18	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
24	24	10	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
25	25	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
26	25	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
27	26	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
28	27	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
29	28	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
30	28	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
31	29	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
32	29	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
33	30	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
34	30	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
35	31	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
36	32	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
37	33	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
38	33	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
39	34	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
40	34	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
41	35	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
42	35	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
43	36	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
44	37	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
45	37	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
46	38	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
47	39	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
48	40	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
49	41	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
50	41	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
51	42	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
52	42	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
53	43	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
54	43	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
55	44	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
56	45	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
57	45	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
58	52	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
59	52	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
60	53	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
61	53	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
62	54	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
63	54	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
64	55	2	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
65	56	2	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
66	57	2	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
67	58	2	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
68	58	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
69	59	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
70	60	2	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
71	60	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
72	60	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
73	61	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
74	61	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
75	62	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
76	62	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
77	63	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
78	63	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
79	63	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
80	64	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
81	64	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
82	65	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
83	65	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
84	66	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
85	67	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
86	68	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
87	69	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
88	70	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
89	71	2	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
90	72	2	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
91	73	2	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
92	74	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
93	74	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
94	75	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
95	75	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
96	76	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
97	76	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
98	77	2	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
99	77	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
100	77	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
101	78	2	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
102	79	2	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
103	79	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
104	80	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
105	81	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
106	81	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
107	82	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
108	83	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
109	84	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
110	84	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
111	85	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
112	85	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
113	86	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
114	86	2	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
115	86	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
116	87	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
117	87	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
118	88	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
119	89	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
120	90	2	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
121	90	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
122	91	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
123	92	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
124	93	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
125	93	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
126	94	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
127	95	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
128	96	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
129	96	2	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
130	97	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
131	98	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
132	99	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
133	99	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
134	100	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
135	100	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
136	100	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
137	101	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
138	102	20	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
139	102	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
140	102	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
141	103	2	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
142	103	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
143	104	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
144	104	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
145	105	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
146	105	2	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
147	105	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
148	105	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
149	106	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
150	106	2	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
151	106	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
152	107	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
153	107	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
154	108	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
155	108	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
156	108	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
157	109	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
158	109	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
159	109	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
160	110	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
161	110	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
162	110	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
163	111	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
164	111	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
165	112	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
166	113	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
167	114	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
168	115	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
169	115	21	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
170	116	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
171	116	21	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
172	117	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
173	118	22	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
174	120	23	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
175	121	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
176	122	2	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
177	122	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
178	123	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
179	124	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
180	124	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
181	125	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
182	125	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
183	126	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
184	126	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
185	127	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
186	127	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
187	128	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
188	128	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
189	129	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
190	130	2	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
191	130	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
192	131	2	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
193	132	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
194	133	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
195	134	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
196	134	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
197	135	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
198	136	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
199	136	2	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
200	136	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
201	137	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
202	137	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
203	138	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
204	138	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
205	139	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
206	140	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
207	141	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
208	141	2	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
209	142	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
210	142	2	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
211	142	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
212	143	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
213	144	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
214	145	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
215	146	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
216	147	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
217	148	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
218	149	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
219	150	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
220	151	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
221	152	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
222	152	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
223	152	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
224	153	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
225	154	2	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
226	155	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
227	156	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
228	156	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
229	157	2	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
230	158	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
231	159	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
232	159	2	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
233	159	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
234	160	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
235	160	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
236	161	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
237	162	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
238	163	2	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
239	163	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
240	163	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
241	164	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
242	164	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
243	165	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
244	166	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
245	167	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
246	168	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
247	168	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
248	169	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
249	169	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
250	170	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
251	170	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
252	171	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
253	171	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
254	171	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
255	172	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
256	172	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
257	173	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
258	173	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
259	174	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
260	174	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
261	175	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
262	176	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
263	177	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
264	178	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
265	178	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
266	179	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
267	179	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
268	180	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
269	180	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
270	181	2	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
271	182	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
272	183	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
273	184	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
274	185	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
275	186	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
276	191	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
277	192	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
278	193	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
279	194	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
280	195	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
281	196	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
282	197	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
283	198	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
284	199	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
285	199	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
286	200	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
287	201	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
288	202	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
289	203	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
290	204	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
291	205	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
292	206	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
293	207	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
294	208	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
295	209	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
296	210	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
297	211	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
298	212	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
299	213	2	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
300	214	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
301	215	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
302	215	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
303	216	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
304	217	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
305	217	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
306	218	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
307	219	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
308	220	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
309	221	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
310	221	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
311	222	2	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
312	223	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
313	224	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
314	228	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
315	229	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
316	230	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
317	231	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
318	232	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
319	233	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
320	234	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
321	235	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
322	235	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
323	236	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
324	237	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
325	238	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
326	239	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
327	240	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
328	241	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
329	241	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
330	242	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
331	243	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
332	244	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
333	244	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
334	245	2	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
335	246	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
336	246	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
337	247	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
338	248	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
339	249	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
340	249	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
341	250	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
342	251	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
343	252	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
344	252	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
345	253	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
346	254	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
347	255	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
348	256	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
349	256	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
350	257	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
351	257	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
352	258	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
353	259	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
354	259	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
355	260	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
356	261	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
357	262	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
358	263	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
359	264	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
360	265	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
361	265	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
362	266	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
363	266	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
364	267	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
365	268	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
366	269	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
367	269	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
368	270	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
369	270	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
370	270	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
371	271	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
372	271	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
373	272	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
374	273	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
375	273	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
376	274	23	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
377	275	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
378	275	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
379	276	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
380	277	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
381	277	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
382	278	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
383	279	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
384	280	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
385	280	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
386	281	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
387	282	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
388	282	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
389	283	2	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
390	284	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
391	284	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
392	285	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
393	286	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
394	287	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
395	288	2	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
396	289	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
397	290	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
398	290	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
399	291	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
400	292	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
401	292	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
402	293	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
403	294	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
404	295	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
405	296	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
406	297	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
407	297	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
408	298	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
409	298	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
410	298	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
411	299	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
412	299	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
413	299	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
414	300	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
415	301	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
416	302	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
417	303	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
418	303	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
419	304	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
420	304	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
421	304	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
422	305	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
423	306	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
424	307	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
425	308	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
426	309	2	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
427	310	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
428	311	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
429	311	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
430	312	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
431	313	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
432	313	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
433	314	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
434	314	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
435	315	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
436	315	2	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
437	315	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
438	316	2	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
439	317	2	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
440	318	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
441	319	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
442	319	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
443	320	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
444	320	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
445	321	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
446	321	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
447	322	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
448	322	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
449	322	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
450	323	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
451	324	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
452	325	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
453	326	1	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
454	326	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
455	326	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
456	327	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
457	328	4	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
458	328	3	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
\.


--
-- Data for Name: PermitLandCovers; Type: TABLE DATA; Schema: public; Owner: hutan_kita_user
--

COPY public."PermitLandCovers" (id, "permitId", "landCoverTypeId", "coverPercentage", "areaHectares", "yearRecorded", "createdAt", "updatedAt") FROM stdin;
1	1	2	40.00	\N	2024	2026-02-16 02:40:43.606+07	2026-02-16 02:40:43.606+07
2	1	5	30.00	\N	2024	2026-02-16 02:40:43.608+07	2026-02-16 02:40:43.608+07
3	1	4	30.00	\N	2024	2026-02-16 02:40:43.608+07	2026-02-16 02:40:43.608+07
4	2	2	40.00	\N	2024	2026-02-16 02:40:43.627+07	2026-02-16 02:40:43.627+07
5	2	5	30.00	\N	2024	2026-02-16 02:40:43.628+07	2026-02-16 02:40:43.628+07
6	2	4	30.00	\N	2024	2026-02-16 02:40:43.629+07	2026-02-16 02:40:43.629+07
7	3	2	40.00	\N	2024	2026-02-16 02:40:43.636+07	2026-02-16 02:40:43.636+07
8	3	5	30.00	\N	2024	2026-02-16 02:40:43.637+07	2026-02-16 02:40:43.637+07
9	3	4	30.00	\N	2024	2026-02-16 02:40:43.637+07	2026-02-16 02:40:43.637+07
10	4	2	40.00	\N	2024	2026-02-16 02:40:43.646+07	2026-02-16 02:40:43.646+07
11	4	5	30.00	\N	2024	2026-02-16 02:40:43.646+07	2026-02-16 02:40:43.646+07
12	4	4	30.00	\N	2024	2026-02-16 02:40:43.647+07	2026-02-16 02:40:43.647+07
13	5	2	40.00	\N	2024	2026-02-16 02:40:43.654+07	2026-02-16 02:40:43.654+07
14	5	5	30.00	\N	2024	2026-02-16 02:40:43.655+07	2026-02-16 02:40:43.655+07
15	5	4	30.00	\N	2024	2026-02-16 02:40:43.655+07	2026-02-16 02:40:43.655+07
16	6	2	40.00	\N	2024	2026-02-16 02:40:43.662+07	2026-02-16 02:40:43.662+07
17	6	5	30.00	\N	2024	2026-02-16 02:40:43.662+07	2026-02-16 02:40:43.662+07
18	6	4	30.00	\N	2024	2026-02-16 02:40:43.663+07	2026-02-16 02:40:43.663+07
19	7	2	40.00	\N	2024	2026-02-16 02:40:43.671+07	2026-02-16 02:40:43.671+07
20	7	5	30.00	\N	2024	2026-02-16 02:40:43.672+07	2026-02-16 02:40:43.672+07
21	7	4	30.00	\N	2024	2026-02-16 02:40:43.673+07	2026-02-16 02:40:43.673+07
22	8	2	40.00	\N	2024	2026-02-16 02:40:43.678+07	2026-02-16 02:40:43.678+07
23	8	5	30.00	\N	2024	2026-02-16 02:40:43.679+07	2026-02-16 02:40:43.679+07
24	8	4	30.00	\N	2024	2026-02-16 02:40:43.679+07	2026-02-16 02:40:43.679+07
25	9	2	40.00	\N	2024	2026-02-16 02:40:43.686+07	2026-02-16 02:40:43.686+07
26	9	5	30.00	\N	2024	2026-02-16 02:40:43.687+07	2026-02-16 02:40:43.687+07
27	9	4	30.00	\N	2024	2026-02-16 02:40:43.687+07	2026-02-16 02:40:43.687+07
28	10	2	40.00	\N	2024	2026-02-16 02:40:43.693+07	2026-02-16 02:40:43.693+07
29	10	5	30.00	\N	2024	2026-02-16 02:40:43.693+07	2026-02-16 02:40:43.693+07
30	10	4	30.00	\N	2024	2026-02-16 02:40:43.694+07	2026-02-16 02:40:43.694+07
31	11	2	40.00	\N	2024	2026-02-16 02:40:43.699+07	2026-02-16 02:40:43.699+07
32	11	5	30.00	\N	2024	2026-02-16 02:40:43.7+07	2026-02-16 02:40:43.7+07
33	11	4	30.00	\N	2024	2026-02-16 02:40:43.7+07	2026-02-16 02:40:43.7+07
34	12	2	40.00	\N	2024	2026-02-16 02:40:43.707+07	2026-02-16 02:40:43.707+07
35	12	5	30.00	\N	2024	2026-02-16 02:40:43.707+07	2026-02-16 02:40:43.707+07
36	12	4	30.00	\N	2024	2026-02-16 02:40:43.708+07	2026-02-16 02:40:43.708+07
37	13	2	40.00	\N	2024	2026-02-16 02:40:43.714+07	2026-02-16 02:40:43.714+07
38	13	5	30.00	\N	2024	2026-02-16 02:40:43.714+07	2026-02-16 02:40:43.714+07
39	13	4	30.00	\N	2024	2026-02-16 02:40:43.714+07	2026-02-16 02:40:43.714+07
40	14	2	40.00	\N	2024	2026-02-16 02:40:43.722+07	2026-02-16 02:40:43.722+07
41	14	5	30.00	\N	2024	2026-02-16 02:40:43.722+07	2026-02-16 02:40:43.722+07
42	14	4	30.00	\N	2024	2026-02-16 02:40:43.723+07	2026-02-16 02:40:43.723+07
43	15	2	40.00	\N	2024	2026-02-16 02:40:43.728+07	2026-02-16 02:40:43.728+07
44	15	5	30.00	\N	2024	2026-02-16 02:40:43.728+07	2026-02-16 02:40:43.728+07
45	15	4	30.00	\N	2024	2026-02-16 02:40:43.729+07	2026-02-16 02:40:43.729+07
46	16	2	40.00	\N	2024	2026-02-16 02:40:43.734+07	2026-02-16 02:40:43.734+07
47	16	5	30.00	\N	2024	2026-02-16 02:40:43.736+07	2026-02-16 02:40:43.736+07
48	16	4	30.00	\N	2024	2026-02-16 02:40:43.737+07	2026-02-16 02:40:43.737+07
49	17	2	40.00	\N	2024	2026-02-16 02:40:43.742+07	2026-02-16 02:40:43.742+07
50	17	5	30.00	\N	2024	2026-02-16 02:40:43.742+07	2026-02-16 02:40:43.742+07
51	17	4	30.00	\N	2024	2026-02-16 02:40:43.742+07	2026-02-16 02:40:43.742+07
52	18	2	40.00	\N	2024	2026-02-16 02:40:43.748+07	2026-02-16 02:40:43.748+07
53	18	5	30.00	\N	2024	2026-02-16 02:40:43.748+07	2026-02-16 02:40:43.748+07
54	18	4	30.00	\N	2024	2026-02-16 02:40:43.749+07	2026-02-16 02:40:43.749+07
55	19	2	40.00	\N	2024	2026-02-16 02:40:43.755+07	2026-02-16 02:40:43.755+07
56	19	5	30.00	\N	2024	2026-02-16 02:40:43.755+07	2026-02-16 02:40:43.755+07
57	19	4	30.00	\N	2024	2026-02-16 02:40:43.756+07	2026-02-16 02:40:43.756+07
58	20	2	40.00	\N	2024	2026-02-16 02:40:43.761+07	2026-02-16 02:40:43.761+07
59	20	5	30.00	\N	2024	2026-02-16 02:40:43.761+07	2026-02-16 02:40:43.761+07
60	20	4	30.00	\N	2024	2026-02-16 02:40:43.761+07	2026-02-16 02:40:43.761+07
61	21	2	40.00	\N	2024	2026-02-16 02:40:43.765+07	2026-02-16 02:40:43.765+07
62	21	5	30.00	\N	2024	2026-02-16 02:40:43.766+07	2026-02-16 02:40:43.766+07
63	21	4	30.00	\N	2024	2026-02-16 02:40:43.766+07	2026-02-16 02:40:43.766+07
64	22	2	40.00	\N	2024	2026-02-16 02:40:43.773+07	2026-02-16 02:40:43.773+07
65	22	5	30.00	\N	2024	2026-02-16 02:40:43.773+07	2026-02-16 02:40:43.773+07
66	22	4	30.00	\N	2024	2026-02-16 02:40:43.774+07	2026-02-16 02:40:43.774+07
67	23	2	40.00	\N	2024	2026-02-16 02:40:43.779+07	2026-02-16 02:40:43.779+07
68	23	5	30.00	\N	2024	2026-02-16 02:40:43.78+07	2026-02-16 02:40:43.78+07
69	23	4	30.00	\N	2024	2026-02-16 02:40:43.78+07	2026-02-16 02:40:43.78+07
70	24	2	40.00	\N	2024	2026-02-16 02:40:43.787+07	2026-02-16 02:40:43.787+07
71	24	5	30.00	\N	2024	2026-02-16 02:40:43.789+07	2026-02-16 02:40:43.789+07
72	24	4	30.00	\N	2024	2026-02-16 02:40:43.789+07	2026-02-16 02:40:43.789+07
73	25	2	40.00	\N	2024	2026-02-16 02:40:43.795+07	2026-02-16 02:40:43.795+07
74	25	5	30.00	\N	2024	2026-02-16 02:40:43.796+07	2026-02-16 02:40:43.796+07
75	25	4	30.00	\N	2024	2026-02-16 02:40:43.796+07	2026-02-16 02:40:43.796+07
76	26	2	40.00	\N	2024	2026-02-16 02:40:43.801+07	2026-02-16 02:40:43.801+07
77	26	5	30.00	\N	2024	2026-02-16 02:40:43.802+07	2026-02-16 02:40:43.802+07
78	26	4	30.00	\N	2024	2026-02-16 02:40:43.802+07	2026-02-16 02:40:43.802+07
79	27	2	40.00	\N	2024	2026-02-16 02:40:43.808+07	2026-02-16 02:40:43.808+07
80	27	5	30.00	\N	2024	2026-02-16 02:40:43.808+07	2026-02-16 02:40:43.808+07
81	27	4	30.00	\N	2024	2026-02-16 02:40:43.809+07	2026-02-16 02:40:43.809+07
82	28	2	40.00	\N	2024	2026-02-16 02:40:43.815+07	2026-02-16 02:40:43.815+07
83	28	5	30.00	\N	2024	2026-02-16 02:40:43.816+07	2026-02-16 02:40:43.816+07
84	28	4	30.00	\N	2024	2026-02-16 02:40:43.816+07	2026-02-16 02:40:43.816+07
85	29	2	40.00	\N	2024	2026-02-16 02:40:43.823+07	2026-02-16 02:40:43.823+07
86	29	5	30.00	\N	2024	2026-02-16 02:40:43.823+07	2026-02-16 02:40:43.823+07
87	29	4	30.00	\N	2024	2026-02-16 02:40:43.824+07	2026-02-16 02:40:43.824+07
88	30	2	40.00	\N	2024	2026-02-16 02:40:43.829+07	2026-02-16 02:40:43.829+07
89	30	5	30.00	\N	2024	2026-02-16 02:40:43.829+07	2026-02-16 02:40:43.829+07
90	30	4	30.00	\N	2024	2026-02-16 02:40:43.83+07	2026-02-16 02:40:43.83+07
91	31	2	40.00	\N	2024	2026-02-16 02:40:43.836+07	2026-02-16 02:40:43.836+07
92	31	5	30.00	\N	2024	2026-02-16 02:40:43.836+07	2026-02-16 02:40:43.836+07
93	31	4	30.00	\N	2024	2026-02-16 02:40:43.838+07	2026-02-16 02:40:43.838+07
94	32	2	40.00	\N	2024	2026-02-16 02:40:43.844+07	2026-02-16 02:40:43.844+07
95	32	5	30.00	\N	2024	2026-02-16 02:40:43.844+07	2026-02-16 02:40:43.844+07
96	32	4	30.00	\N	2024	2026-02-16 02:40:43.845+07	2026-02-16 02:40:43.845+07
97	33	2	40.00	\N	2024	2026-02-16 02:40:43.85+07	2026-02-16 02:40:43.85+07
98	33	5	30.00	\N	2024	2026-02-16 02:40:43.851+07	2026-02-16 02:40:43.851+07
99	33	4	30.00	\N	2024	2026-02-16 02:40:43.852+07	2026-02-16 02:40:43.852+07
100	34	2	40.00	\N	2024	2026-02-16 02:40:43.857+07	2026-02-16 02:40:43.857+07
101	34	5	30.00	\N	2024	2026-02-16 02:40:43.858+07	2026-02-16 02:40:43.858+07
102	34	4	30.00	\N	2024	2026-02-16 02:40:43.858+07	2026-02-16 02:40:43.858+07
103	35	2	40.00	\N	2024	2026-02-16 02:40:43.864+07	2026-02-16 02:40:43.864+07
104	35	5	30.00	\N	2024	2026-02-16 02:40:43.864+07	2026-02-16 02:40:43.864+07
105	35	4	30.00	\N	2024	2026-02-16 02:40:43.865+07	2026-02-16 02:40:43.865+07
106	36	2	40.00	\N	2024	2026-02-16 02:40:43.871+07	2026-02-16 02:40:43.871+07
107	36	5	30.00	\N	2024	2026-02-16 02:40:43.872+07	2026-02-16 02:40:43.872+07
108	36	4	30.00	\N	2024	2026-02-16 02:40:43.872+07	2026-02-16 02:40:43.872+07
109	37	2	40.00	\N	2024	2026-02-16 02:40:43.877+07	2026-02-16 02:40:43.877+07
110	37	5	30.00	\N	2024	2026-02-16 02:40:43.878+07	2026-02-16 02:40:43.878+07
111	37	4	30.00	\N	2024	2026-02-16 02:40:43.878+07	2026-02-16 02:40:43.878+07
112	38	2	40.00	\N	2024	2026-02-16 02:40:43.884+07	2026-02-16 02:40:43.884+07
113	38	5	30.00	\N	2024	2026-02-16 02:40:43.885+07	2026-02-16 02:40:43.885+07
114	38	4	30.00	\N	2024	2026-02-16 02:40:43.886+07	2026-02-16 02:40:43.886+07
115	39	2	40.00	\N	2024	2026-02-16 02:40:43.891+07	2026-02-16 02:40:43.891+07
116	39	5	30.00	\N	2024	2026-02-16 02:40:43.891+07	2026-02-16 02:40:43.891+07
117	39	4	30.00	\N	2024	2026-02-16 02:40:43.892+07	2026-02-16 02:40:43.892+07
118	40	2	40.00	\N	2024	2026-02-16 02:40:43.896+07	2026-02-16 02:40:43.896+07
119	40	5	30.00	\N	2024	2026-02-16 02:40:43.897+07	2026-02-16 02:40:43.897+07
120	40	4	30.00	\N	2024	2026-02-16 02:40:43.897+07	2026-02-16 02:40:43.897+07
121	41	2	40.00	\N	2024	2026-02-16 02:40:43.903+07	2026-02-16 02:40:43.903+07
122	41	5	30.00	\N	2024	2026-02-16 02:40:43.905+07	2026-02-16 02:40:43.905+07
123	41	4	30.00	\N	2024	2026-02-16 02:40:43.906+07	2026-02-16 02:40:43.906+07
124	42	2	40.00	\N	2024	2026-02-16 02:40:43.91+07	2026-02-16 02:40:43.91+07
125	42	5	30.00	\N	2024	2026-02-16 02:40:43.911+07	2026-02-16 02:40:43.911+07
126	42	4	30.00	\N	2024	2026-02-16 02:40:43.911+07	2026-02-16 02:40:43.911+07
127	43	2	40.00	\N	2024	2026-02-16 02:40:43.916+07	2026-02-16 02:40:43.916+07
128	43	5	30.00	\N	2024	2026-02-16 02:40:43.916+07	2026-02-16 02:40:43.916+07
129	43	4	30.00	\N	2024	2026-02-16 02:40:43.917+07	2026-02-16 02:40:43.917+07
130	44	2	40.00	\N	2024	2026-02-16 02:40:43.923+07	2026-02-16 02:40:43.923+07
131	44	5	30.00	\N	2024	2026-02-16 02:40:43.923+07	2026-02-16 02:40:43.923+07
132	44	4	30.00	\N	2024	2026-02-16 02:40:43.924+07	2026-02-16 02:40:43.924+07
133	45	2	40.00	\N	2024	2026-02-16 02:40:43.929+07	2026-02-16 02:40:43.929+07
134	45	5	30.00	\N	2024	2026-02-16 02:40:43.93+07	2026-02-16 02:40:43.93+07
135	45	4	30.00	\N	2024	2026-02-16 02:40:43.931+07	2026-02-16 02:40:43.931+07
136	46	2	40.00	\N	2024	2026-02-16 02:40:43.936+07	2026-02-16 02:40:43.936+07
137	46	5	30.00	\N	2024	2026-02-16 02:40:43.937+07	2026-02-16 02:40:43.937+07
138	46	4	30.00	\N	2024	2026-02-16 02:40:43.937+07	2026-02-16 02:40:43.937+07
139	47	2	40.00	\N	2024	2026-02-16 02:40:43.942+07	2026-02-16 02:40:43.942+07
140	47	5	30.00	\N	2024	2026-02-16 02:40:43.943+07	2026-02-16 02:40:43.943+07
141	47	4	30.00	\N	2024	2026-02-16 02:40:43.943+07	2026-02-16 02:40:43.943+07
142	48	2	40.00	\N	2024	2026-02-16 02:40:43.949+07	2026-02-16 02:40:43.949+07
143	48	5	30.00	\N	2024	2026-02-16 02:40:43.95+07	2026-02-16 02:40:43.95+07
144	48	4	30.00	\N	2024	2026-02-16 02:40:43.95+07	2026-02-16 02:40:43.95+07
145	49	2	40.00	\N	2024	2026-02-16 02:40:43.956+07	2026-02-16 02:40:43.956+07
146	49	5	30.00	\N	2024	2026-02-16 02:40:43.957+07	2026-02-16 02:40:43.957+07
147	49	4	30.00	\N	2024	2026-02-16 02:40:43.957+07	2026-02-16 02:40:43.957+07
148	50	2	40.00	\N	2024	2026-02-16 02:40:43.962+07	2026-02-16 02:40:43.962+07
149	50	5	30.00	\N	2024	2026-02-16 02:40:43.962+07	2026-02-16 02:40:43.962+07
150	50	4	30.00	\N	2024	2026-02-16 02:40:43.963+07	2026-02-16 02:40:43.963+07
\.


--
-- Data for Name: PriorityScores; Type: TABLE DATA; Schema: public; Owner: hutan_kita_user
--

COPY public."PriorityScores" (id, "permitId", "legalScore", "biophysicalScore", "commodityScore", "sdmScore", "marketScore", "environmentScore", "compositeScore", "priorityCategory", "lastCalculated", "createdAt", "updatedAt") FROM stdin;
1	1	0.75	0.77	0.39	0.17	0.94	0.85	0.49	SIAP DIBINA	2026-02-16 02:40:43.623+07	2026-02-16 02:40:43.623+07	2026-02-16 02:40:43.623+07
2	2	0.72	0.58	0.58	0.04	0.79	0.13	0.66	SIAP DIBINA	2026-02-16 02:40:43.634+07	2026-02-16 02:40:43.634+07	2026-02-16 02:40:43.634+07
3	3	0.22	0.06	0.89	0.04	0.76	0.01	0.44	SIAP DIBINA	2026-02-16 02:40:43.644+07	2026-02-16 02:40:43.644+07	2026-02-16 02:40:43.644+07
4	4	0.69	0.39	0.09	0.88	0.52	0.92	0.53	SIAP DIBINA	2026-02-16 02:40:43.652+07	2026-02-16 02:40:43.652+07	2026-02-16 02:40:43.652+07
5	5	0.80	0.86	0.49	0.15	0.96	0.61	0.58	SIAP DIBINA	2026-02-16 02:40:43.66+07	2026-02-16 02:40:43.66+07	2026-02-16 02:40:43.66+07
6	6	0.52	0.25	0.49	0.17	0.38	0.03	0.43	SIAP DIBINA	2026-02-16 02:40:43.669+07	2026-02-16 02:40:43.669+07	2026-02-16 02:40:43.669+07
7	7	0.40	0.17	0.38	0.14	0.79	0.27	0.55	SIAP DIBINA	2026-02-16 02:40:43.677+07	2026-02-16 02:40:43.677+07	2026-02-16 02:40:43.677+07
8	8	0.64	0.54	0.01	0.77	0.98	0.30	0.60	SIAP DIBINA	2026-02-16 02:40:43.684+07	2026-02-16 02:40:43.684+07	2026-02-16 02:40:43.684+07
9	9	0.63	0.73	0.68	0.61	0.52	0.71	0.43	SIAP DIBINA	2026-02-16 02:40:43.691+07	2026-02-16 02:40:43.691+07	2026-02-16 02:40:43.691+07
10	10	0.85	0.19	0.52	0.70	0.26	0.01	0.64	SIAP DIBINA	2026-02-16 02:40:43.697+07	2026-02-16 02:40:43.697+07	2026-02-16 02:40:43.697+07
11	11	0.25	0.43	0.01	0.76	0.08	0.69	0.68	SIAP DIBINA	2026-02-16 02:40:43.705+07	2026-02-16 02:40:43.705+07	2026-02-16 02:40:43.705+07
12	12	0.80	0.70	0.66	0.11	0.08	0.98	0.64	SIAP DIBINA	2026-02-16 02:40:43.712+07	2026-02-16 02:40:43.712+07	2026-02-16 02:40:43.712+07
13	13	0.70	0.79	0.37	0.26	0.75	0.21	0.58	SIAP DIBINA	2026-02-16 02:40:43.719+07	2026-02-16 02:40:43.719+07	2026-02-16 02:40:43.719+07
14	14	0.60	0.35	0.75	0.22	0.27	0.02	0.38	PERLU PEMULIHAN	2026-02-16 02:40:43.726+07	2026-02-16 02:40:43.726+07	2026-02-16 02:40:43.726+07
15	15	0.91	0.58	0.86	0.57	0.07	0.60	0.58	SIAP DIBINA	2026-02-16 02:40:43.732+07	2026-02-16 02:40:43.732+07	2026-02-16 02:40:43.732+07
16	16	0.13	0.10	0.57	0.80	0.54	0.92	0.32	PERLU PEMULIHAN	2026-02-16 02:40:43.74+07	2026-02-16 02:40:43.74+07	2026-02-16 02:40:43.74+07
17	17	0.79	0.36	0.30	0.50	0.22	0.87	0.45	SIAP DIBINA	2026-02-16 02:40:43.746+07	2026-02-16 02:40:43.746+07	2026-02-16 02:40:43.746+07
18	18	0.33	0.77	0.02	0.22	0.06	0.62	0.45	SIAP DIBINA	2026-02-16 02:40:43.753+07	2026-02-16 02:40:43.753+07	2026-02-16 02:40:43.753+07
19	19	0.81	0.75	0.57	0.18	0.41	0.14	0.62	SIAP DIBINA	2026-02-16 02:40:43.759+07	2026-02-16 02:40:43.759+07	2026-02-16 02:40:43.759+07
20	20	0.61	0.35	0.95	0.68	0.23	0.10	0.39	PERLU PEMULIHAN	2026-02-16 02:40:43.764+07	2026-02-16 02:40:43.764+07	2026-02-16 02:40:43.764+07
21	21	0.83	0.68	0.41	0.11	0.56	0.55	0.55	SIAP DIBINA	2026-02-16 02:40:43.772+07	2026-02-16 02:40:43.772+07	2026-02-16 02:40:43.772+07
22	22	0.97	0.76	0.39	0.12	0.63	0.63	0.65	SIAP DIBINA	2026-02-16 02:40:43.778+07	2026-02-16 02:40:43.778+07	2026-02-16 02:40:43.778+07
23	23	0.13	0.52	0.95	0.58	0.83	0.59	0.40	PERLU PEMULIHAN	2026-02-16 02:40:43.784+07	2026-02-16 02:40:43.784+07	2026-02-16 02:40:43.784+07
24	24	0.19	0.13	0.18	0.77	0.86	0.92	0.40	PERLU PEMULIHAN	2026-02-16 02:40:43.793+07	2026-02-16 02:40:43.793+07	2026-02-16 02:40:43.793+07
25	25	0.47	0.27	0.22	0.33	0.74	0.84	0.44	SIAP DIBINA	2026-02-16 02:40:43.799+07	2026-02-16 02:40:43.799+07	2026-02-16 02:40:43.799+07
26	26	0.99	0.58	0.78	0.61	0.35	0.65	0.64	SIAP DIBINA	2026-02-16 02:40:43.806+07	2026-02-16 02:40:43.807+07	2026-02-16 02:40:43.807+07
27	27	0.56	0.18	0.37	0.53	0.24	0.06	0.42	SIAP DIBINA	2026-02-16 02:40:43.814+07	2026-02-16 02:40:43.814+07	2026-02-16 02:40:43.814+07
28	28	0.16	0.41	0.24	0.63	0.53	0.98	0.57	SIAP DIBINA	2026-02-16 02:40:43.821+07	2026-02-16 02:40:43.821+07	2026-02-16 02:40:43.821+07
29	29	0.06	0.23	0.54	0.11	0.18	0.53	0.39	PERLU PEMULIHAN	2026-02-16 02:40:43.828+07	2026-02-16 02:40:43.828+07	2026-02-16 02:40:43.828+07
30	30	0.65	0.30	0.82	0.33	0.86	0.29	0.38	PERLU PEMULIHAN	2026-02-16 02:40:43.834+07	2026-02-16 02:40:43.834+07	2026-02-16 02:40:43.834+07
31	31	0.03	0.47	0.79	0.79	0.70	0.55	0.53	SIAP DIBINA	2026-02-16 02:40:43.842+07	2026-02-16 02:40:43.842+07	2026-02-16 02:40:43.842+07
32	32	0.75	0.03	0.76	0.14	0.07	0.91	0.32	PERLU PEMULIHAN	2026-02-16 02:40:43.849+07	2026-02-16 02:40:43.849+07	2026-02-16 02:40:43.849+07
33	33	0.41	0.61	0.89	0.34	0.95	0.61	0.47	SIAP DIBINA	2026-02-16 02:40:43.856+07	2026-02-16 02:40:43.856+07	2026-02-16 02:40:43.856+07
34	34	0.44	0.91	0.03	0.85	0.03	0.32	0.51	SIAP DIBINA	2026-02-16 02:40:43.862+07	2026-02-16 02:40:43.862+07	2026-02-16 02:40:43.862+07
35	35	0.08	0.68	0.78	0.20	0.42	0.01	0.31	PERLU PEMULIHAN	2026-02-16 02:40:43.869+07	2026-02-16 02:40:43.869+07	2026-02-16 02:40:43.869+07
36	36	0.31	0.57	0.55	0.13	0.80	0.21	0.46	SIAP DIBINA	2026-02-16 02:40:43.876+07	2026-02-16 02:40:43.876+07	2026-02-16 02:40:43.876+07
37	37	0.24	0.98	0.74	0.63	0.29	0.57	0.53	SIAP DIBINA	2026-02-16 02:40:43.882+07	2026-02-16 02:40:43.882+07	2026-02-16 02:40:43.882+07
38	38	0.78	0.69	0.47	0.64	0.64	0.08	0.51	SIAP DIBINA	2026-02-16 02:40:43.89+07	2026-02-16 02:40:43.89+07	2026-02-16 02:40:43.89+07
39	39	0.19	0.45	0.50	0.01	0.07	0.14	0.33	PERLU PEMULIHAN	2026-02-16 02:40:43.895+07	2026-02-16 02:40:43.895+07	2026-02-16 02:40:43.895+07
40	40	0.02	0.66	0.52	0.98	0.33	0.98	0.36	PERLU PEMULIHAN	2026-02-16 02:40:43.902+07	2026-02-16 02:40:43.902+07	2026-02-16 02:40:43.902+07
41	41	0.28	0.96	0.68	0.30	0.08	0.96	0.46	SIAP DIBINA	2026-02-16 02:40:43.909+07	2026-02-16 02:40:43.909+07	2026-02-16 02:40:43.909+07
42	42	0.09	0.49	0.08	0.48	0.16	1.00	0.40	SIAP DIBINA	2026-02-16 02:40:43.914+07	2026-02-16 02:40:43.914+07	2026-02-16 02:40:43.914+07
43	43	0.17	0.97	0.71	0.06	0.57	0.73	0.56	SIAP DIBINA	2026-02-16 02:40:43.921+07	2026-02-16 02:40:43.921+07	2026-02-16 02:40:43.921+07
44	44	0.93	0.81	0.88	0.85	0.53	0.33	0.88	SIAP INDUSTRI	2026-02-16 02:40:43.928+07	2026-02-16 02:40:43.928+07	2026-02-16 02:40:43.928+07
45	45	0.02	0.66	0.71	0.45	0.38	0.80	0.27	PERLU PEMULIHAN	2026-02-16 02:40:43.935+07	2026-02-16 02:40:43.935+07	2026-02-16 02:40:43.935+07
46	46	0.30	0.53	1.00	0.94	0.23	0.40	0.44	SIAP DIBINA	2026-02-16 02:40:43.941+07	2026-02-16 02:40:43.941+07	2026-02-16 02:40:43.941+07
47	47	0.17	0.48	0.36	0.99	0.42	0.38	0.43	SIAP DIBINA	2026-02-16 02:40:43.947+07	2026-02-16 02:40:43.947+07	2026-02-16 02:40:43.947+07
48	48	0.55	0.92	0.95	0.83	0.98	0.25	0.63	SIAP DIBINA	2026-02-16 02:40:43.955+07	2026-02-16 02:40:43.955+07	2026-02-16 02:40:43.955+07
49	49	0.74	0.03	0.19	0.02	0.01	0.15	0.40	PERLU PEMULIHAN	2026-02-16 02:40:43.96+07	2026-02-16 02:40:43.961+07	2026-02-16 02:40:43.961+07
50	50	0.09	0.12	0.40	0.28	0.36	0.42	0.21	PERLU PEMULIHAN	2026-02-16 02:40:43.975+07	2026-02-16 02:40:43.975+07	2026-02-16 02:40:43.975+07
\.


--
-- Data for Name: ProductionRecords; Type: TABLE DATA; Schema: public; Owner: hutan_kita_user
--

COPY public."ProductionRecords" (id, "permitId", "commodityId", year, month, "quantityRaw", "quantityProcessed", unit, notes, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: ProtectedZones; Type: TABLE DATA; Schema: public; Owner: hutan_kita_user
--

COPY public."ProtectedZones" (id, name, "zoneType", boundary, "areaHectares", "legalBasis", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Provinces; Type: TABLE DATA; Schema: public; Owner: hutan_kita_user
--

COPY public."Provinces" (id, name, code, "createdAt", "updatedAt") FROM stdin;
1	18	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
2	Maluku Utara	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
\.


--
-- Data for Name: Regencies; Type: TABLE DATA; Schema: public; Owner: hutan_kita_user
--

COPY public."Regencies" (id, "provinceId", name, type, code, "createdAt", "updatedAt") FROM stdin;
1	1	17	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
2	2	Tidore Kepulauan	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
3	2	Kota Ternate	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
4	2	Halmahera Utara	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
5	2	Halmahera Timur	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
6	2	Halmahera Tengah	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
7	2	Halmahera Selatan	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
8	2	Kepulauan Sula	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
9	2	Pulau Taliabu	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
10	2	Pulau Morotai	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
11	2	Halmahera Barat	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
\.


--
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: hutan_kita_user
--

COPY public."SequelizeMeta" (name) FROM stdin;
20240214000000-initial-schema.js
20260216000000-advanced-modules.js
\.


--
-- Data for Name: SocialForestPermits; Type: TABLE DATA; Schema: public; Owner: hutan_kita_user
--

COPY public."SocialForestPermits" (id, "institutionId", "villageId", "schemeId", location, boundary, "permitNumber", "permitYear", "permitStatus", "validFrom", "validUntil", "areaPermitted", "areaInProcess", "hasPhysicalDoc", "hasPdfDoc", "hasHandover", "hasLandConflict", "roadAccessType", "portAccess", "distanceToMarket", notes, "createdAt", "updatedAt") FROM stdin;
2	2	2	1	\N	\N	8334 TAHUN 2024 tanggal 10 Juni 2024	\N	2024	\N	\N	4380.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
3	3	3	1	\N	\N	8331 TAHUN 2024 tanggal 10 Juni 2024	\N	2024	\N	\N	2582.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
4	4	4	1	\N	\N	8395 TAHUN 2023 tanggal 10 Juni 2024	\N	2024	\N	\N	2785.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
5	5	5	1	\N	\N	8333 TAHUN 2024 tanggal 10 Juni 2024	\N	2024	\N	\N	4991.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
6	6	6	1	\N	\N	8336 TAHUN 2024 tanggal 10 Juni 2024	\N	2024	\N	\N	3860.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
7	7	7	1	\N	\N	8329 TAHUN 2024 tanggal 10 Juni 2024	\N	2024	\N	\N	4449.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
8	8	8	1	\N	\N	\t8397 TAHUN 2024 tanggal 19 Juni 2024	\N	2024	\N	\N	455.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
9	9	9	1	\N	\N	8332 TAHUN 2024 tanggal 10 Juni 2024	\N	2024	\N	\N	2701.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
12	12	12	2	\N	\N	SK.10693/MENLHK-PSKL/PKPS/PSL.0/9/2023 tanggal 14 September 2023	235	2023	\N	\N	0.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
16	16	16	2	\N	\N	SK.10691/MENLHK-PSKL/PKPS/PSL.0/9/2023 tanggal 14 September 2023	64	2023	\N	\N	0.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
17	17	17	2	\N	\N	SK.10768/MENLHK-PSKL/PKPS/PSL.0/9/2023 tanggal 14 September 2023	190	2023	\N	\N	0.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
22	22	22	1	0101000020E61000001B800D8810E75F40A260C614AC71DA3F	\N	SK. 6246/MENLHK-PSKL/PKPS/PSL.0/7/2019 tanggal 11 Juli 2019	308	2019	\N	\N	0.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
23	23	23	1	0101000020E6100000868E1D54E2E55F40782975C93846DB3F	\N	SK. 8111/MENLHK-PSKL/PKPS/PSL.0/9/2019 tanggal 27 September 2019	551	2019	\N	\N	0.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
24	24	24	1	0101000020E61000007784D38217ED5F4059DE550F9887DA3F	\N	SK. 9361/MENLHK-PSKL/PKPS/PSL.0/11/2019 tanggal 05 November 2019	4	2019	\N	\N	0.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
25	25	25	1	0101000020E6100000B1FCF9B660D45F4012143FC6DCB5E83F	\N	SK.2062/Menlhk-PSKL/PKPS/PSL.0/4/2017 tanggal 11 April 2017	2017	Izin	\N	\N	126.00	0.00	t	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
26	26	26	1	0101000020E610000064062AE3DFD65F40F86C1D1CECCDE93F	\N	SK.2059/Menlhk-PSKL/PKPS/PSL.0/4/2017 tanggal 11 April 2017	2017	Izin	\N	\N	139.00	0.00	t	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
27	27	27	2	0101000020E6100000BA11161571D75F4044C02154A959E93F	\N	Kep. Walikota No.140/II.11/KT/2014 tanggal 11 September 2014	2014	Izin	\N	\N	100.00	0.00	f	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
28	28	28	1	0101000020E61000002009FB7612D45F40BA13ECBFCE4DEC3F	\N	SK.2063/Menlhk-PSKL/PKPS/PSL.0/4/2017 tanggal 11 April 2017	2017	Izin	\N	\N	85.00	0.00	t	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
29	29	29	1	0101000020E6100000301004C8D0D25F408E3C1059A489E93F	\N	SK.2060/Menlhk-PSKL/PKPS/PSL.0/4/2017 tanggal 11 April 2017 	2017	Izin	\N	\N	218.00	0.00	t	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
30	30	30	1	0101000020E61000005A2C45F295D65F40D734EF384547EB3F	\N	SK.2061/Menlhk-PSKL/PKPS/PSL.0/4/2017 tanggal 11 April 2017	2017	Izin	\N	\N	159.00	0.00	t	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
31	31	31	2	0101000020E6100000B08C0DDDECD75F40FF959526A520E93F	\N	Kep. Walikota No.139/II.11/KT/2014 tanggal 11 September 2014	2014	Izin	\N	\N	90.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
32	32	32	2	0101000020E6100000107A36AB3ED85F40FD169D2CB55EEA3F	\N	Kep. Walikota No.138/II.11/KT/2014 tanggal 11 September 2014	2014	Izin	\N	\N	100.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
33	33	33	2	\N	\N	SK.10775/MENLHK-PSKL/PKPS/PSL.0/9/2023 tanggal 29 september 2023	2023	Izin	\N	\N	219.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
34	34	34	2	\N	\N	SK.10720/MENLHK-PSKL/PKPS/PSL.0/9/2023 tanggal 29 september 2023	2023	Izin	\N	\N	458.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
35	35	35	2	0101000020E61000006F48A30227D75F4012F8C3CF7F0FEB3F	\N	SK. 1188/MENLHK-PSKL/PKPS/PSL.0/3/2020 tanggal 18 Maret 2020	2020	Izin	\N	\N	171.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
36	36	36	2	0101000020E6100000E085ADD9CA995F40CE55F31C916FF53F	\N	SK. 10420/MENLHK-PSKL/PKPS/PSL.0/12/2019 tanggal 26 Desember 2019	2019	Izin	\N	\N	82.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
37	37	37	2	\N	\N	SK.10719/MENLHK-PSKL/PKPS/PSL.0/9/2023 tanggal 14 September 2023	2023	Izin	\N	\N	239.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
38	38	38	2	0101000020E61000007BBDFBE3BD975F407C5F5CAAD216F53F	\N	SK. 10419/MENLHK-PSKL/PKPS/PSL.0/12/2019 tanggal 26 Desember 2019	2019	Izin	\N	\N	129.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
39	39	39	2	0101000020E6100000F817416326D55F402B4D4A41B797EC3F	\N	SK.8172/MENLHK-PSKL/PKTHA/PSL.1/10/2022 tanggal 20 Oktober 2022	2022	Izin	\N	\N	71.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
40	40	40	2	0101000020E6100000DB6D179AEB965F40FD84B35BCB24F53F	\N	SK. 10421/MENLHK-PSKL/PKPS/PSL.0/12/2019 tanggal 26 Desember 2019	2019	Izin	\N	\N	125.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
41	41	41	2	\N	\N	SK.10738/MENLHK-PSKL/PKPS/PSL.0/9/2023 tanggal 14 September 2023	2023	Izin	\N	\N	288.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
42	42	42	2	0101000020E61000000805A568E5D25F409A07B0C8AF1FEA3F	\N	SK. 10422/MENLHK-PSKL/PKPS/PSL.0/12/2019 tanggal 26 Desember 2019	2019	Izin	\N	\N	113.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
43	43	43	2	\N	\N	SK.11577/MENLHK-PSKL/PKPS/PSL.0/9/2023 tanggal 14 September 2023	2023	Izin	\N	\N	257.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
44	44	44	2	0101000020E61000004B5CC7B8E2D35F408F17D2E1210CEB3F	\N	SK.8181/MENLHK-PSKL/PKTHA/PSL.1/10/2022 tanggal 20 Oktober 2022	2022	Izin	\N	\N	102.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
45	45	45	1	\N	\N	SK. 8396 Tahun 2024 tanggal 10 Juni 2024	2024	Izin	\N	\N	1052.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
46	46	46	1	\N	\N	13576 TAHUN 2024	2024	Izin	\N	\N	1661.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
47	47	47	1	\N	\N	Proses	2024	Proses	\N	\N	0.00	146.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
48	48	48	1	\N	\N	13574 TAHUN 2024	2024	Izin	\N	\N	113.00	113.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
49	49	49	1	\N	\N	13577 TAHUN 2024	2024	Izin	\N	\N	145.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
50	50	50	1	\N	\N	13553 TAHUN 2024	2024	Izin	\N	\N	114.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
11	11	11	1	0101000020E6100000BBEEAD484CE25F403485CE6BEC12E23F	0103000020E610000001000000050000004AB1A371A8E15F40E2CCAFE600C1E13F2C2CB81FF0E25F40E2CCAFE600C1E13F2C2CB81FF0E25F40863DEDF0D764E23F4AB1A371A8E15F40863DEDF0D764E23F4AB1A371A8E15F40E2CCAFE600C1E13F	SK. 10265/MENLHK-PSKL/PKPS/PSL.0/12/2019 tanggal 20 Desember 2019	234	2019	\N	\N	0.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-16 03:02:04.82+07
14	14	14	1	0101000020E6100000DE57E542E5E75F40183F8D7BF31BD93F	0103000020E610000001000000050000006D1ADB6B41E75F4074CE4F711C78D83F4F95EF1989E85F4074CE4F711C78D83F4F95EF1989E85F40BCAFCA85CABFD93F6D1ADB6B41E75F40BCAFCA85CABFD93F6D1ADB6B41E75F4074CE4F711C78D83F	SK.10293/MENLHK-PSKL/PKPS/PSL.0/12/2019 tanggal 20 Desember 2019	1	2019	\N	\N	0.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-16 03:02:04.822+07
18	18	18	2	0101000020E61000009EEDD11BEED95F40E89FE062450DE63F	0103000020E610000001000000050000002DB0C7444AD95F4096E7C1DD59BBE53F0F2BDCF291DA5F4096E7C1DD59BBE53F0F2BDCF291DA5F403A58FFE7305FE63F2DB0C7444AD95F403A58FFE7305FE63F2DB0C7444AD95F4096E7C1DD59BBE53F	SK. 10423/MENLHK-PSKL/PKPS/PSL.0/12/2019 tanggal 26 Desember 2019	103	2019	\N	\N	0.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-16 03:02:04.824+07
19	19	19	2	0101000020E610000077D9AF3BDDD75F40C347C49448A2E53F	0103000020E61000000100000005000000069CA56439D75F40718FA50F5D50E53FE816BA1281D85F40718FA50F5D50E53FE816BA1281D85F401500E31934F4E53F069CA56439D75F401500E31934F4E53F069CA56439D75F40718FA50F5D50E53F	SK. 10425/MENLHK-PSKL/PKPS/PSL.0/12/2019 tanggal 26 Desember 2019	110	2019	\N	\N	0.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-16 03:02:04.825+07
21	21	21	1	0101000020E6100000DF1AD82AC1E55F40FF3F4E98309ADA3F	0103000020E610000001000000050000006EDDCD531DE55F405BCF108E59F6D93F5058E20165E65F405BCF108E59F6D93F5058E20165E65F40A3B08BA2073EDB3F6EDDCD531DE55F40A3B08BA2073EDB3F6EDDCD531DE55F405BCF108E59F6D93F	SK. 6240/MENLHK-PSKL/PKPS/PSL.0/7/2019 tanggal 11 Juli 2019	399	2019	\N	\N	0.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-16 03:02:04.827+07
51	51	51	1	\N	\N	13573 TAHUN 2024	2024	Izin	\N	\N	151.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
52	52	52	1	\N	\N	SK. 8394 Tahun 2024 tanggal 10 Juni 2024	2024	Izin	\N	\N	314.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
53	53	53	1	0101000020E610000071C971A774F45F407EC9C6832DF6FC3F	\N	SK. 7964/MENLHK-PSKL/PKPS/PSL.0/9/2019 tanggal 24 September 2019	2019	Izin	\N	\N	1757.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
54	54	54	1	0101000020E6100000B39AAE27BAF35F40EAAEEC82C1F5FC3F	\N	SK. 7386/MENLHK-PSKL/PKPS/PSL.0/9/2019 tanggal 09 September 2019	2019	Izin	\N	\N	1861.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
55	55	55	1	0101000020E61000002766BD18CAF65F406EA6423C122FF43F	\N	SK.7966/MENLHK-PSKL/PKPS/PSL.0/9/2019 tanggal 24 September 2019	2019	Izin	\N	\N	271.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
56	56	56	1	0101000020E6100000EF8E8CD5E6F35F407558E1968F64F43F	\N	SK.7963/MENLHK-PSKL/PKPS/PSL.0/9/2019 tanggal 24 September 2019	2019	Izin	\N	\N	215.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
57	57	57	1	0101000020E6100000E8F9D34675006040FA5FAE450B90F43F	\N	SK.10487/MENLHK-PSKL/PKPS/PSL.0/12/2019 tanggal 27 Desember 2019	2019	Izin	\N	\N	109.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
58	58	58	1	0101000020E61000003A22DFA5D4FE5F40143DF03158F1F43F	\N	SK.1590/MENLHK-PSKL/PKPS/PSL.0/3/2021 tanggal 30 maret 2021	2021	Izin	\N	\N	150.00	0.00	t	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
59	59	59	1	0101000020E6100000711DE38A8BFC5F4069E388B5F814F93F	\N	SK.8109/MENLHK-PSKL/PKPS/PSL.0/9/2019 tanggal 27 September 2019	2019	Izin	\N	\N	865.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
60	60	60	2	0101000020E610000010CAFB389AFF5F409AB1683A3B59FA3F	\N	SK.9597/MENLHK-PSKL/PKPS/PSL.0/11/2019 tanggal 14 November 2019	2019	Izin	\N	\N	268.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
61	61	61	1	0101000020E61000001F317A6EA1F05F409CDEC5FB71BBFD3F	\N	SK.833/MENLHK-PSKL/PKPS/PSL.0/3/2021 tanggal 3 Maret 2021	2021	Izin	\N	\N	108.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
62	62	62	1	\N	\N	SK.9908/MENLHK-PSKL/PKPS/PSL.0/9/2023 tanggal 14 september 2023	2023	Izin	\N	\N	204.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
63	63	63	1	\N	\N	SK.9907/MENLHK-PSKL/PKPS/PSL.0/9/2023 tanggal  14 september 2023	2023	Izin	\N	\N	214.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
64	64	64	1	0101000020E6100000DA3A38D89BF95F40ACAC6D8AC7C5FC3F	\N	SK.1587/MENLHK-PSKL/PKPS/PSL.0/3/2021 tanggal 30 maret 2021	2021	Izin	\N	\N	1163.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
65	65	65	1	0101000020E61000007D24253D0CF65F4081E9B46E831AFD3F	\N	SK.1597/MENLHK-PSKL/PKPS/PSL.0/3/2021 tanggal 30 Maret 2021	2021	Izin	\N	\N	145.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
66	66	66	1	0101000020E61000000E32C9C859F25F40ED0C535BEA20FD3F	\N	SK.1002/MENLHK-PSKL/PKPS/PSL.0/3/2021 tanggal 15 Maret 2021	2021	Izin	\N	\N	373.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
67	67	67	1	0101000020E61000003196E99788F25F40658C0FB3972DFD3F	\N	SK.478/MENLHK-PSKL/PKPS/PSL.0/2/2021 tanggal 3 Februari 2021	2021	Izin	\N	\N	317.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
68	68	68	1	\N	\N	SK.9941/MENLHK-PSKL/PKPS/PSL.0/9/2023	2023	Izin	\N	\N	136.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
69	69	69	1	0101000020E610000013B69F8CF1FD5F4072E0D57267860040	\N	SK.1551/MENLHK-PSKL/PKPS/PSL.0/3/2021 tanggal 30 maret 2021	2021	Izin	\N	\N	220.00	0.00	t	f	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
70	70	70	1	0101000020E6100000E10D6954E0FC5F40410E4A98691B0040	\N	SK.363/MENLHK-PSKL/PKPS/PSL.0/1/2021 26 Januari 2021	2021	Izin	\N	\N	888.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
71	71	71	1	0101000020E61000009ED1562591FA5F40C6DCB5847C50F43F	\N	SK.487/MENLHK-PSKL/PKPS/PSL.0/2/2021 tanggal 4 Februari 2021	2021	Izin	\N	\N	48.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
72	72	72	1	0101000020E610000074CFBA46CBF45F40399A232BBF4CF43F	\N	SK.4832/MENLHK-PSKL/PKPS/PSL.0/8/2020	2020	Izin	\N	\N	86.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
73	73	73	1	0101000020E610000074B2D47ABFF45F405F61C1FD8047F43F	\N	SK.4913/MENLHK-PSKL/PKPS/PSL.0/8/2020	2020	Izin	\N	\N	95.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
74	74	74	1	0101000020E610000054FEB5BC72F45F40963243BFC328F63F	\N	SK.9945/MENLHK-PSKL/PKTHA/PSL.1/12/2022 tanggal 15 Desember 2022	2022	Izin	\N	\N	1149.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
75	75	75	1	0101000020E61000000F4240BE84F55F40B7439D9B31CAF63F	\N	SK.8148/MENLHK-PSKL/PKTHA/PSL.1/10/2022 tanggal 20 Oktober 2022	2022	Izin	\N	\N	1858.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
76	76	76	1	0101000020E6100000344F09E302F25F407F94D1FBD822F63F	\N	SK.7905/MENLHK-PSKL/PKPS/PSL.0/10/2022 tanggal 7 Oktober 2022	2022	Izin	\N	\N	4174.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
77	77	77	1	0101000020E6100000A19E3E027FF25F4019F1C0A709B0F53F	\N	SK.8152/MENLHK-PSKL/PKTHA/PSL.1/10/2022 tanggal 20 Oktober 2022	2022	Izin	\N	\N	2323.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
78	78	78	1	0101000020E61000005B785E2A36EA5F4065A9F57EA3DDF03F	\N	SK.3432/MENLHK-PSKL/PKPS/PSL.0/4/2022 tanggal 13 April 2022	2022	Izin	\N	\N	481.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
79	79	79	1	0101000020E6100000B5A50EF27AFE5F401E4E603AAD5BF53F	\N	SK.1591/MENLHK-PSKL/PKPS/PSL.0/3/2021 tanggal 30 maret 2021	2021	Izin	\N	\N	258.00	0.00	t	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
80	80	80	1	\N	\N	SK.9940/MENLHK-PSKL/PKPS/PSL.0/9/2023	2023	Izin	\N	\N	925.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
81	81	81	1	\N	\N	SK.9909/MENLHK-PSKL/PKPS/PSL.0/9/2023	2023	Izin	\N	\N	209.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
82	82	82	1	\N	\N	SK.11575/MENLHK-PSKL/PKPS/PSL.0/9/2023 tanggal 14 September 2023	2023	Izin	\N	\N	214.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
83	83	83	1	\N	\N	SK.9939/MENLHK-PSKL/PKPS/PSL.0/9/2023	2023	Izin	\N	\N	66.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
84	84	84	1	\N	\N	SK.9910/MENLHK-PSKL/PKPS/PSL.0/9/2023	2023	Izin	\N	\N	210.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
85	85	85	1	\N	\N	SK.9938/MENLHK-PSKL/PKPS/PSL.0/9/2023 tanggal 14 September 2023	2023	Izin	\N	\N	1627.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
86	86	86	1	\N	\N	SK.9944/MENLHK-PSKL/PKPS/PSL.0/9/2023	2023	Izin	\N	\N	444.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
87	87	87	1	\N	\N	SK.9905/MENLHK-PSKL/PKPS/PSL.0/9/2023	2023	Izin	\N	\N	36.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
88	88	88	1	\N	\N	SK.9943/MENLHK-PSKL/PKPS/PSL.0/9/2023	2023	Izin	\N	\N	137.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
89	89	89	1	\N	\N	SK.9942/MENLHK-PSKL/PKPS/PSL.0/9/2023	2023	Izin	\N	\N	217.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
90	90	90	1	\N	\N	SK.9906/MENLHK-PSKL/PKPS/PSL.0/9/2023 tanggal 14 September 2023	2023	Izin	\N	\N	442.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
91	91	91	1	\N	\N	SK.9936/MENLHK-PSKL/PKPS/PSL.0/9/2023 tanggal 14 September 2023	2023	Izin	\N	\N	1995.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
92	92	92	1	0101000020E61000001E6E8786C5F05F40B9E2E2A8DC84F13F	\N	SK.364/MENLHK-PSKL/PKPS/PSL.0/1/2021 tanggal 26 Januari 2021	2021	Izin	\N	\N	84.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
93	93	93	1	\N	\N	SK.9937/MENLHK-PSKL/PKPS/PSL.0/9/2023	2023	Izin	\N	\N	1699.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
94	94	94	1	0101000020E61000007CD11E2F24006040B685E7A562A3FB3F	\N	SK.10358/MENLHK-PSKL/PKTHA/PSL.1/12/2022 tanggal 27 Desember 2022	2022	Izin	\N	\N	148.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
95	95	95	1	0101000020E61000007EC9C6832D0060409F39EB538E89FB3F	\N	SK.10356/MENLHK-PSKL/PKTHA/PSL.1/12/2022 tanggal 27 Desember 2022	2022	Izin	\N	\N	199.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
96	96	96	1	0101000020E6100000728C648F50FE5F408E739B70AFCCF93F	\N	SK.10355/MENLHK-PSKL/PKTHA/PSL.1/12/2022 tanggal 27 Desember 2022	2022	Izin	\N	\N	325.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
97	97	97	1	\N	\N	SK.9901/MENLHK-PSKL/PKPS/PSL.0/9/2023 tanggal 14 September 2023	2023	Izin	\N	\N	212.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
98	98	98	1	\N	\N	SK.9945/MENLHK-PSKL/PKPS/PSL.0/9/2023 tanggal 14 September 2023	2023	Izin	\N	\N	251.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
99	99	99	1	0101000020E6100000C4D155BABBFF5F4000E1438996FCFB3F	\N	SK.10357/MENLHK-PSKL/PKTHA/PSL.1/12/2022 tanggal 27 Desember 2022	2022	Izin	\N	\N	110.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
100	100	100	1	\N	\N	SK.9935/MENLHK-PSKL/PKPS/PSL.0/9/2023 tanggal 14 September 2023	2023	Izin	\N	\N	4489.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
101	101	101	1	\N	\N	SK.9912/MENLHK-PSKL/PKPS/PSL.0/9/2023 tanggal 14 September 2023	2023	Izin	\N	\N	4307.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
102	102	102	1	0101000020E610000096218E7571FF5F404CAAB69BE09BFA3F	\N	SK.1552/MENLHK-PSKL/PKPS/PSL.0/3/2021 tanggal 30 Maret 2021	2021	Izin	\N	\N	670.00	0.00	t	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
103	103	103	1	0101000020E61000002766BD18CAFE5F40D3DB9F8B860CFA3F	\N	SK.902/MENLHK-PSKL/PKPS/PSL.0/3/2021 tanggal 4 Maret 2021	2021	Izin	\N	\N	565.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
104	104	104	1	0101000020E610000095F0845E7FFF5F4034BF9A0304B3FA3F	\N	SK.369/MENLHK-PSKL/PKPS/PSL.0/1/2021 tanggal 26 Januari 2021	2021	Izin	\N	\N	938.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
105	105	105	1	0101000020E6100000F415A4198BFF5F404EB6813B5067FA3F	\N	SK.370/MENLHK-PSKL/PKPS/PSL.0/1/2021 26 Januari 2021	2021	Izin	\N	\N	450.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
106	106	60	1	0101000020E6100000F2B0506B9AFF5F409AB1683A3B59FA3F	\N	SK.1189/MENLHK-PSKL/PKPS/PSL.0/3/2020 18 Maret 2020	2020	Izin	\N	\N	478.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
107	107	106	1	\N	\N	SK.9916/MENLHK-PSKL/PKPS/PSL.0/9/2023 tanggal 14 September 2023	2023	Izin	\N	\N	348.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
108	108	107	1	\N	\N	SK.9917/MENLHK-PSKL/PKPS/PSL.0/9/2023 tanggal 14 September 2023	2023	Izin	\N	\N	206.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
109	109	108	1	\N	\N	SK.9901/MENLHK-PSKL/PKPS/PSL.0/9/2023 tanggal 14 September 2023	2023	Izin	\N	\N	1121.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
110	110	109	1	\N	\N	SK.9913/MENLHK-PSKL/PKPS/PSL.0/9/2023	2023	Izin	\N	\N	629.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
111	111	110	1	\N	\N	SK.9902/MENLHK-PSKL/PKPS/PSL.0/9/2023	2023	Izin	\N	\N	544.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
112	112	111	1	\N	\N	SK.9915/MENLHK-PSKL/PKPS/PSL.0/9/2023 tanggal 14 September 2023	2023	Izin	\N	\N	247.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
113	113	112	1	\N	\N	SK.9914/MENLHK-PSKL/PKPS/PSL.0/9/2023 tanggal 14 September 2023	2023	Izin	\N	\N	40.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
114	114	113	1	\N	\N	8338 TAHUN 2024 tanggal 10 Juni 2024	2024	Izin	\N	\N	0.00	166.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
115	115	114	1	\N	\N	8392 TAHUN 2024 tanggal 10 Juni 2024	2024	Izin	\N	\N	0.00	131.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
116	116	115	1	\N	\N	8393 TAHUN 2024 tanggal 10 Juni 2024	2024	Izin	\N	\N	0.00	111.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
117	117	116	1	\N	\N	8339 TAHUN 2024 tanggal 10 Juni 2024	2024	Izin	\N	\N	0.00	422.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
118	118	117	1	\N	\N	8391 TAHUN 2024 tanggal 10 Juni 2024	2024	Izin	\N	\N	0.00	176.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
119	119	118	1	\N	\N	Proses	2024	Proses	\N	\N	0.00	337.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
120	120	119	1	\N	\N	8390 TAHUN 2024 tanggal 10 Juni 2024	2024	Izin	\N	\N	0.00	46.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
121	121	120	1	\N	\N	8389 TAHUN 2024 tanggal 10 Juni 2024	2024	Izin	\N	\N	0.00	3133.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
122	122	121	1	\N	\N	SK.5105/MENLHK-PSKL/PKPS/PSL.0/6/2022 tanggal 13 Juni 2022	2022	Izin	\N	\N	935.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
123	123	122	1	0101000020E61000002159C0046E056040FA43334FAEA9F13F	\N	SK. 8515/MENLHK-PSKL/PKPS/PSL.0/12/2018 Tanggal 12 Desember 2018	2018	Izin	\N	\N	233.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
124	124	123	1	0101000020E61000002F52280B5F046040C1374D9F1DF0F13F	\N	SK. 8287/MENLHK-PSKL/PKPS/PSL.0/11/2018 tanggal 29 November 2018	2018	Izin	\N	\N	3357.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
125	125	124	2	0101000020E6100000DE0033DFC1FE5F40334FAE299019F13F	\N	SK. 1363/MENLHK-PSKL/PKPS/PSL.0/2/2019 tanggal 18 Februari 2019	2019	Izin	\N	\N	1239.00	0.00	f	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
126	126	125	2	0101000020E6100000F35487DC0CFE5F400C207C28D1D2F03F	\N	SK. 9042/MENLHK-PSKL/PKPS/PSL.0/12/2018 tanggal 28 Desember 2018	2018	Izin	\N	\N	2641.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
127	127	126	2	0101000020E610000010786000610160405A9BC6F65AD0F13F	\N	SK. 9043/MENLHK-PSKL/PKPS/PSL.0/12/2018 tanggal 28 Desember 2018	2018	Izin	\N	\N	489.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
128	128	127	2	0101000020E61000000EF6268664006040EC4E779E788EF13F	\N	SK. 9046/MENLHK-PSKL/PKPS/PSL.0/12/2018 tanggal 28 Desember 2018	2018	Izin	\N	\N	702.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
129	129	128	1	0101000020E61000006ABC749318066040D05E7D3CF45DF23F	\N	SK.3368/MENLHK-PSKL/PKPS/PSL.0/4/2021        tanggal 1 April 2021	2021	Izin	\N	\N	676.00	0.00	f	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
130	130	128	2	0101000020E6100000D5B14AE919066040F38E53742457F23F	\N	SK.1493/MENLHK-PSKL/PKPS/PSL.0/3/2021 tanggal 30 maret 2021	2021	Izin	\N	\N	231.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
131	131	129	1	0101000020E6100000DE3B6A4C080660400B293FA9F629F63F	\N	SK.9090/MENLHK-PSKL/PKPS/PSL.0/10/2019 tanggal 25 Oktober 2019	2019	Izin	\N	\N	2486.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
132	132	130	1	0101000020E6100000FCFCF7E0B5086040E770ADF6B017E73F	\N	SK.1217/MENLHK-PSKL/PKPS/PSL.0/3/2021 tanggal 30 maret 2021	2021	Izin	\N	\N	136.00	0.00	t	f	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
133	133	131	1	\N	\N	SK.6845/MENLHK-PSKL/PKPS/PSL.0/8/2022 tanggal 25 Agustus 2022	2022	Izin	\N	\N	159.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
134	134	132	1	\N	\N	SK.5542/MENLHK-PSKL/PKPS/PSL.0/6/2022 tanggal 16 Juni 2022	2022	Izin	\N	\N	116.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
135	135	133	1	0101000020E6100000CC7F48BF7D096040E0641BB80375EC3F	\N	SK.1588/MENLHK-PSKL/PKPS/PSL.0/3/2021        tanggal 30 Maret 2021	2021	Izin	\N	\N	759.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
136	136	134	1	\N	\N	SK.5554/MENLHK-PSKL/PKPS/PSL.0/6/2022 tanggal 16 Juni 2022	2022	Izin	\N	\N	321.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
137	137	135	1	\N	\N	SK.5144/MENLHK-PSKL/PKPS/PSL.0/6/2022 tanggal 13 Juni 2022	2022	Izin	\N	\N	506.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
138	138	136	1	0101000020E6100000349F73B76B106040B456B439CEEDE23F	\N	SK.1142/MENLHK-PSKL/PKPS/PSL.0/3/2021 tanggal 24 maret 2021	2021	Izin	\N	\N	3112.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
139	139	137	1	0101000020E6100000198C1189420F60402D4146408523E33F	\N	SK.6195/MENLHK-PSKL/PKPS/PSL.0/11/2020	2020	Izin	\N	\N	656.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
140	140	138	1	0101000020E6100000056F48A3021860403A765089EB18F63F	\N	SK.4110/MENLHK-PSKL/PKPS/PSL.0/6/2020 tanggal 29 Juni 2020\n	2020	Izin	\N	\N	124.00	0.00	t	f	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
141	141	139	1	0101000020E61000002FA2ED98BA0360400000000020580E41	\N	SK.4982/MENLHK-PSKL/PKPS/PSL.0/6/2022 tanggal 6 Juni 2022	2022	Izin	\N	\N	445.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
142	142	140	1	\N	\N	SK.10751/MENLHK-PSKL/PKPS/PSL.0/9/2023 tanggal 14 September 2023	2023	Izin	\N	\N	1989.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
143	143	141	1	\N	\N	8385 TAHUN 2024 tanggal 10 Juni 2024	2024	Izin	\N	\N	0.00	733.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
144	144	142	1	\N	\N	\t8388 TAHUN 2024  tanggal 10 Juni 2024	2024	Izin	\N	\N	0.00	795.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
145	145	143	1	\N	\N	8383 TAHUN 2024 tanggal 10 Juni 2024	2024	Izin	\N	\N	0.00	797.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
146	146	144	1	\N	\N	8386 TAHUN 2024 tanggal 10 Juni 2024	2024	Izin	\N	\N	0.00	303.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
147	147	145	1	\N	\N	8384 TAHUN 2024 tanggal 10 Juni 2024	2024	Izin	\N	\N	0.00	726.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
148	148	146	1	\N	\N	8387 TAHUN 2024 tanggal 10 Juni 2024	2024	Izin	\N	\N	0.00	309.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
149	149	147	2	0101000020E610000016C3D5011006604087A3AB74779DDB3F	\N	SK. 5237/MENLHK-PSKL/PKPS/PSL.0/5/2019 tanggal 29 Mei 2019	2019	Izin	\N	\N	321.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
150	150	148	1	0101000020E61000006C787AA52CF85F40B0C91AF5108DC23F	\N	SK. 10278/MENLHK-PSKL/PKPS/PSL.0/12/2019 tanggal 20 Desember 2019	2019	Izin	\N	\N	468.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
151	151	149	1	\N	\N	SK.10704/MENLHK-PSKL/PKPS/PSL.0/9/2023 tanggal 14 September 2023	2023	Izin	\N	\N	783.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
152	152	150	1	0101000020E6100000BEDC274701FA5F40D7FA22A12DE7D93F	\N	SK.6196/MENLHK-PSKL/PKPS/PSL.0/11/2020	2020	Izin	\N	\N	1441.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
153	153	151	1	0101000020E610000086C8E9EBF9F35F40D76CE525FF13E43F	\N	SK. 3768/MENLHK-PSKL/PKPS/PSL.0/4/2019 tanggal 10 April 2019	2019	Izin	\N	\N	2038.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
154	154	152	1	\N	\N	SK.10272/MENLHK-PSKL/PKPS/PSL.0/9/2023	2023	Izin	\N	\N	704.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
155	155	153	1	\N	\N	SK.10739/MENLHK-PSKL/PKPS/PSL.0/9/2023 tanggal 14 September 2023	2023	Izin	\N	\N	877.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
156	156	154	1	\N	\N	SK.10746/MENLHK-PSKL/PKPS/PSL.0/9/2023 tanggal 14 September 2023	2023	Izin	\N	\N	202.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
157	157	155	1	\N	\N	SK.10678/MENLHK-PSKL/PKPS/PSL.0/9/2023 tanggal 14 September 2023	2023	Izin	\N	\N	562.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
158	158	156	1	\N	\N	SK.10690/MENLHK-PSKL/PKPS/PSL.0/9/2023 tanggal 14 September 2023	2023	Izin	\N	\N	230.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
159	159	157	1	\N	\N	SK.10770/MENLHK-PSKL/PKPS/PSL.0/9/2023 tanggal 14 September 2023	2023	Izin	\N	\N	1647.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
160	160	158	1	\N	\N	SK.10773/MENLHK-PSKL/PKPS/PSL.0/9/2023	2023	Izin	\N	\N	1617.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
161	161	159	1	0101000020E61000009CA8A5B915F85F402312859675FFD43F	\N	SK.5475/MENLHK-PSKL/PKPS/PSL.0/10/2020\ttanggal 10 November 2020	2020	Izin	\N	\N	320.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
162	162	160	1	0101000020E6100000FAD51C2018076040EE77280AF489DA3F	\N	SK. 5540/MENLHK-PSKL/PKPS/PSL.0/6/2022 tanggal 16 Juni 2022	2022	Izin	\N	\N	2415.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
163	163	161	1	\N	\N	11377 TAHUN 2024	2024	Izin	\N	\N	255.00	255.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
164	164	162	1	0101000020E6100000EC8497E0D4EE5F4073BB97FBE428E6BF	\N	SK.10632/MENLHK-PSKL/PKPS/PSL.0/12/2019	2019	Izin	\N	\N	1261.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
165	165	163	2	0101000020E61000001502B9C491DE5F4034B91803EBB8E5BF	\N	SK. 10545/MENLHK-PSKL/PKPS/PSL.0/12/2019 tanggal 27 Desember 2019	2019	Izin	\N	\N	208.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
166	166	164	2	0101000020E61000007D76C075C5DF5F40137CD3F4D901E5BF	\N	SK. 10418/MENLHK-PSKL/PKPS/PSL.0/12/2019 tanggal 26 Desember 2019	2019	Izin	\N	\N	225.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
167	167	165	1	0101000020E6100000B66801DA56DF5F40C11DA8531EDDE4BF	\N	SK.10846/MENLHK-PSKL/PKPS/PSL.0/12/2019 tanggal 31 Desember 2019	2019	Izin	\N	\N	318.00	0.00	t	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
168	168	166	1	0101000020E6100000E8154F3DD2EA5F4083C0CAA145B6E6BF	\N	SK.10290/MENLHK-PSKL/PKPS/PSL.0/12/2019	2019	Izin	\N	\N	622.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
169	169	167	1	0101000020E6100000E197FA7953E35F400E4FAF946508E4BF	\N	SK. 10295/MENLHK-PSKL/PKPS/PSL.0/12/2019 tanggal 20 Desember 2019	2019	Izin	\N	\N	450.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
170	170	168	1	\N	\N	6747 TAHUN 2024 tanggal 2 mei 2024	2024	Izin	\N	\N	250.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
171	171	169	1	\N	\N	SK.6254 Tahun 2024, tanggal 25 Maret 2024	2024	Izin	\N	\N	279.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
172	172	170	1	\N	\N	6279 Tahun 2024	2024	Izin	\N	\N	485.00	0.00	t	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
173	173	171	1	\N	\N	6291 Tahun 2024	2024	Izin	\N	\N	290.00	0.00	t	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
174	174	172	1	\N	\N	6231 Tahun 2024	2024	Izin	\N	\N	270.00	0.00	t	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
175	175	173	1	\N	\N	6264 Tahun 2024	2024	Izin	\N	\N	281.00	0.00	t	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
176	176	174	1	\N	\N	6263 Tahun 2024	2024	Izin	\N	\N	339.00	0.00	t	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
177	177	175	1	\N	\N	6255 Tahun 2024	2024	Izin	\N	\N	136.00	0.00	t	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
178	178	176	1	\N	\N	6249 Tahun 2024	2024	Izin	\N	\N	161.00	0.00	t	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
179	179	177	1	\N	\N	SK.6237Tahun 2024	2024	Izin	\N	\N	570.00	0.00	t	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
180	180	178	1	0101000020E6100000A4349BC761E15F407E00529B3839E4BF	\N	SK.1550/MENLHK-PSKL/PKPS/PSL.0/3/2021 tanggal 30 maret 2021	2021	Izin	\N	\N	393.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
181	181	179	3	\N	\N	SK. 171 Tahun 2009 tanggal 29 Juli 2009	2009	Izin	\N	\N	5851.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
182	182	180	5	0101000020E61000002EE411DC48EA5F40EC33677DCA31DCBF	\N	SK.1984/MENLHK-PSKL/PKPS/PSL.0/4/2021 tanggal 24 April 2021	2021	Izin	\N	\N	276.00	0.00	t	f	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
183	183	181	5	0101000020E6100000ACADD85F76EB5F40841266DAFE95DFBF	\N	SK.3326/MENLHK-PSKL/PKPS/PSL.0/4/2021        tanggal 1 April 2021	2021	Izin	\N	\N	38.00	0.00	t	f	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
184	184	182	5	0101000020E6100000A704C4245CE65F40C7A17E17B6E6E3BF	\N	SK.1953/MENLHK-PSKL/PKPS/PSL.0/3/2021 tanggal 31 Maret 2021	2021	Izin	\N	\N	313.00	0.00	t	f	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
185	185	183	5	0101000020E6100000D8B628B341DB5F4075914259F87AE3BF	\N	SK.1939/MENLHK-PSKL/PKPS/PSL.0/4/2021 tanggal 24 April 2021	2021	Izin	\N	\N	231.00	0.00	t	f	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
186	186	184	5	0101000020E6100000B6847CD0B3DD5F40374F75C8CD70E2BF	\N	SK.3369/MENLHK-PSKL/PKPS/PSL.0/5/2021        tanggal 10 Mei 2021	2021	Izin	\N	\N	307.00	0.00	t	f	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
187	187	185	1	\N	\N	Proses	2024	Proses	\N	\N	0.00	491.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
188	188	186	1	\N	\N	13564 TAHUN 2024	2024	Izin	\N	\N	1.21	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
189	189	187	1	\N	\N	Proses	2024	Proses	\N	\N	0.00	793.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
190	190	188	1	\N	\N	13563 TAHUN 2024	2024	Izin	\N	\N	656.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
191	191	189	1	0101000020E6100000FA47DFA469815F40289CDD5A268302C0	\N	SK.4109/MENLHK-PSKL/PKPS/PSL.0/6/2020 tanggal 29 Juni 2020	2020	Izin	\N	\N	790.00	0.00	t	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
192	192	190	1	0101000020E61000002AA913D044805F402F302B14E91E02C0	\N	SK.25/MENLHK-PSKL/PKPS/PSL.0/1/2021	2021	Izin	\N	\N	947.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
193	193	191	1	0101000020E61000003080F0A144845F409A97C3EE3BA603C0	\N	SK. 10499/MENLHK-PSKL/PKPS/PSL.0/12/2019 tanggal 27 Desember 2019	2019	Izin	\N	\N	570.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
194	194	192	1	0101000020E6100000A054FB743C7E5F405CACA8C1348C00C0	\N	SK. 8883/MENLHK-PSKL/PKPS/PSL.0/10/2019 tanggal 18 Oktober 2019	2019	Izin	\N	\N	706.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
195	195	193	1	0101000020E6100000164B917C25795F40C286A757CA7201C0	\N	SK. 10501/MENLHK-PSKL/PKPS/PSL.0/12/2019 tanggal 27 Desember 2019	2019	Izin	\N	\N	200.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
196	196	194	1	0101000020E6100000D66F26A60B825F40E014562AA8A802C0	\N	SK. 10288/MENLHK-PSKL/PKPS/PSL.0/12/2019 tanggal 20 Desember 2019	2019	Izin	\N	\N	400.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
197	197	195	1	0101000020E61000003C889D2974815F405F07CE19515AFEBF	\N	SK.385/MENLHK-PSKL/PKPS/PSL.0/3/2021 tanggal 3 Maret 2021	2021	Izin	\N	\N	759.00	0.00	t	f	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
198	198	196	1	0101000020E6100000060DFD135C775F40AF230ED940DA00C0	\N	SK. 10500/MENLHK-PSKL/PKPS/PSL.0/12/2019 tanggal 27 Desember 2019	2019	Izin	\N	\N	1155.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
199	199	197	1	0101000020E61000001B13622EA9785F4077137CD3F43901C0	\N	SK. 10492/MENLHK-PSKL/PKPS/PSL.0/12/2019 tanggal 27 Desember 2019	2019	Izin	\N	\N	1102.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
200	200	198	1	0101000020E6100000933A014D847D5F409F3C2CD49AE600C0	\N	SK.8489/MENLHK-PSKL/PKPS/PSL.0/12/2021 tanggal 24 Desember 2021	2021	Izin	\N	\N	155.00	0.00	t	f	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
201	201	199	1	0101000020E6100000A7E8482EFF7D5F400000000000549FC0	\N	SK.8491/MENLHK-PSKL/PKPS/PSL.0/12/2021 tanggal 24 Desember 2021	2021	Izin	\N	\N	463.00	0.00	t	f	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
202	202	200	1	0101000020E6100000AA61BF27D67B5F4008E57D1CCD5102C0	\N	SK. 10294/MENLHK-PSKL/PKPS/PSL.0/12/2019 tanggal 20 Desember 2019	2019	Izin	\N	\N	764.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
203	203	201	1	0101000020E6100000D7A3703D0A7E5F40D97745F0BF9501C0	\N	SK. 8885/MENLHK-PSKL/PKPS/PSL.0/10/2019 tanggal 18 Oktober 2019	2019	Izin	\N	\N	700.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
204	204	202	1	0101000020E61000000F5EBBB4E17A5F407903CC7C071F02C0	\N	SK. 10498/MENLHK-PSKL/PKPS/PSL.0/12/2019 tanggal 27 Desember 2019	2019	Izin	\N	\N	751.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
205	205	203	1	0101000020E61000001689096AF87D5F408B8862F206B800C0	\N	SK. 10276/MENLHK-PSKL/PKPS/PSL.0/12/2019 tanggal 20 Desember 2019	2019	Izin	\N	\N	956.00	0.00	t	f	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
206	206	204	1	0101000020E6100000F2086EA46C7D5F408B71FE26146201C0	\N	SK. 4113/MENLHK-PSKL/PKPS/PSL.0/6/2020 tanggal 29 Juni 2020	2020	Izin	\N	\N	1284.00	0.00	t	f	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
207	207	205	1	0101000020E610000018416326517E5F40E6E786A6EC3403C0	\N	SK.4222/MENLHK-PSKL/PKPS/PSL.0/6/2020 tanggal 31 Desember 2019	2019	Izin	\N	\N	1184.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
208	208	206	1	0101000020E61000008A1F63EE5A7E5F4096218E75719B00C0	\N	SK.8490/MENLHK-PSKL/PKPS/PSL.0/12/2021 tanggal 24 Desember 2021	2021	Izin	\N	\N	511.00	0.00	t	f	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
209	209	207	1	0101000020E61000003D7FDAA84E7D5F4033FAD170CA1C01C0	\N	SK. 8901/MENLHK-PSKL/PKPS/PSL.0/10/2019 tanggal 18 Oktober 2019	2019	Izin	\N	\N	1035.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
210	210	208	1	0101000020E6100000FD885FB1867E5F40865451BCCABA01C0	\N	SK. 10902/MENLHK-PSKL/PKPS/PSL.0/12/2019 tanggal 31 Desember 2019	2019	Izin	\N	\N	543.00	0.00	t	f	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
211	211	209	1	0101000020E6100000E77118CC5F7D5F40AA66D652409A02C0	\N	SK. 10493/MENLHK-PSKL/PKPS/PSL.0/12/2019 tanggal 27 Desember 2019	2019	Izin	\N	\N	691.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
212	212	210	1	0101000020E61000008D9C853DED7E5F40D4B837BF61A2FEBF	\N	SK.1156/MENLHK-PSKL/PKPS/PSL.0/3/2021 tanggal 24 Maret 2021	2021	Izin	\N	\N	921.00	0.00	t	f	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
213	213	211	1	\N	\N	6748 TAHUN 2024 tanggal 2 mei 2024	2024	Izin	\N	\N	851.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
214	214	212	1	\N	\N	8019 TAHUN 2024 tanggal 31 mei 2024	2024	Izin	\N	\N	571.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
215	215	213	1	\N	\N	6258 Tahun 2024 tanggal 25 Maret 2024	2024	Izin	\N	\N	462.00	0.00	t	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
216	216	214	1	\N	\N	6266 Tahun 2024 tanggal 25 Maret 2024	2024	Izin	\N	\N	1078.00	0.00	t	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
217	217	215	1	\N	\N	6269 Tahun 2024 tanggal 25 Maret 2024	2024	Izin	\N	\N	785.00	0.00	t	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
218	218	216	1	0101000020E61000002CB6494563785F4027C286A7578A01C0	\N	SK. 10489/MENLHK-PSKL/PKPS/PSL.0/12/2019 tanggal 27 Desember 2019	2019	Izin	\N	\N	545.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
219	219	217	1	0101000020E6100000151DC9E53F845F40E44EE960FD1FFEBF	\N	SK.1147/MENLHK-PSKL/PKPS/PSL.0/3/2021 tanggal 24 Maret 2021	2021	Izin	\N	\N	1294.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
220	220	218	1	0101000020E6100000DBDC989EB0815F4007B29E5A7DB503C0	\N	SK. 10488/MENLHK-PSKL/PKPS/PSL.0/12/2019 tanggal 27 Desember 2019	2019	Izin	\N	\N	695.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
221	221	219	1	\N	\N	SK. 6267 Tahun 2024 tanggal 25 Maret 2024	2024	Izin	\N	\N	506.00	0.00	t	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
222	222	220	1	0101000020E6100000C5025FD1AD4C5F401E882CD2C4BBFBBF	\N	SK. 5953/MENLHK-PSKL/PKPS/PSL.0/9/2018 tanggal 19 September 2018	2018	Izin	\N	\N	1771.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
223	223	221	1	0101000020E61000007539252026465F4028B9C3263233FCBF	\N	SK. 6498/MENLHK-PSKL/PKPS/PSL.0/10/2018 tanggal 2 Oktober 2018	2018	Izin	\N	\N	495.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
224	224	222	1	0101000020E61000004E0CC9C9C4525F408B6EBDA60785FCBF	\N	SK. 1468/MENLHK-PSKL/PKPS/PSL.0/2/2019 tanggal 27 Februari 2019	2019	Izin	\N	\N	1700.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
225	225	223	1	\N	\N	13570 TAHUN 2024	2024	Izin	\N	\N	401.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
226	226	224	1	\N	\N	13572 TAHUN 2024	2024	Izin	\N	\N	804.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
227	227	225	1	\N	\N	13571 TAHUN 2024	2024	Izin	\N	\N	1181.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
228	228	226	1	0101000020E6100000D1AFAD9F7E1460408C852172FA3A0240	\N	SK. 6779/MENLHK-PSKL/PKPS/PSL.0/10/2018 tanggal 8 Oktober 2018	2018	Izin	\N	\N	2797.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
229	229	227	1	0101000020E6100000575A46EABD116040191F662FDB0E0540	\N	SK. 7229/MENLHK-PSKL/PKPS/PSL.0/10/2018 tanggal 11 Oktober 2018	2018	Izin	\N	\N	532.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
230	230	228	1	0101000020E610000050C422861D166040158E209562670340	\N	SK. 6822/MENLHK-PSKL/PKPS/PSL.0/10/2018 tanggal 8 Oktober 2018	2018	Izin	\N	\N	1536.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
231	231	229	1	0101000020E610000034D8D479540F60402E39EE940E760040	\N	SK. 6789/MENLHK-PSKL/PKPS/PSL.0/10/2018 tanggal 8 Oktober 2018	2018	Izin	\N	\N	610.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
232	232	230	1	0101000020E6100000CB2E185C730760402B4B749659840240	\N	SK. 6658/MENLHK-PSKL/PKPS/PSL.0/10/2018 tanggal 5 Oktober 2018	2018	Izin	\N	\N	311.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
233	233	231	1	0101000020E6100000C1029832F0126040E54526E0D7680140	\N	SK. 7117/MENLHK-PSKL/PKPS/PSL.0/10/2018 tanggal 10 Oktober 2018	2018	Izin	\N	\N	611.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
234	234	232	1	0101000020E6100000143FC6DCB5126040DD24068195430140	\N	SK.8480/MENLHK-PSKL/PKPS/PSL.0/12/2021 tanggal 24 Desember 2021	2021	Izin	\N	\N	954.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
235	235	233	1	\N	\N	6293 Tahun 2024	2024	Izin	\N	\N	2507.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
236	236	234	1	\N	\N	6298 Tahun 2024	2024	Izin	\N	\N	1339.00	0.00	t	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
237	237	235	1	\N	\N	6256 Tahun 2024	2024	Izin	\N	\N	170.00	0.00	t	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
238	238	236	1	\N	\N	6262 Tahun 2024	2024	Izin	\N	\N	777.00	0.00	t	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
239	239	237	1	0101000020E6100000B537F8C2640660404182E2C7983B0240	\N	SK.8479/MENLHK-PSKL/PKPS/PSL.0/12/2021 tanggal 24 Desember 2021	2021	Izin	\N	\N	747.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
240	240	238	2	0101000020E61000007920B248131560407AFD497CEE040340	\N	SK. 1102/MENLHK-PSKL/PKPS/PSL.0/3/2020 tanggal 09 Maret 2020	2020	Izin	\N	\N	1705.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
241	241	239	1	0101000020E6100000C139234A7B1360404D840D4FAF940140	\N	SK.8481/MENLHK-PSKL/PKPS/PSL.0/12/2021 tanggal 24 Desember 2021	2021	Izin	\N	\N	3284.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
242	242	240	1	0101000020E6100000B5E0455FC11060407C0A80F10C9A0440	\N	SK. 10630/MENLHK-PSKL/PKPS/PSL.0/12/2019 tanggal 31 Desember 2019	2019	Izin	\N	\N	518.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
243	243	241	1	\N	\N	SK.10807/MENLHK-PSKL/PKPS/PSL.0/9/2023 	2023	Izin	\N	\N	233.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
244	244	242	1	\N	\N	SK.10767/MENLHK-PSKL/PKPS/PSL.0/9/2023 tanggal 14 September 2023	2023	Izin	\N	\N	85.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
245	245	243	3	\N	\N	SK.134/Menhut-II/2010 tanggal 19 Juli 2010	2010	Izin	\N	\N	480.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
246	246	244	1	\N	\N	SK.10743/MENLHK-PSKL/PKPS/PSL.0/9/2023 tanggal 14 September 2023	2023	Izin	\N	\N	338.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
247	247	245	1	0101000020E6100000EA95B20C71146040613255302AA90240	\N	SK.8482/MENLHK-PSKL/PKPS/PSL.0/12/2021 tanggal 24 Desember 2021	2021	Izin	\N	\N	1836.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
248	248	246	1	0101000020E610000035B22B2D23E15F403C2D3F7095A7EF3F	\N	SK. 57/MENLHK-PSKL/PKPS/PSL.0/1/2018 tanggal 10 Januari 2018	2018	Izin	\N	\N	974.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
249	249	247	1	0101000020E610000027DC2BF356DF5F400DA9A27895F5F53F	\N	SK.7627/MENLHK-PSKL/PKPS/PSL.0/9/2022 tanggal 30 September 2022	2022	Izin	\N	\N	545.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
250	250	248	1	0101000020E6100000172B6A300DE15F402B3410CB668EEE3F	\N	SK. 5176/MENLHK-PSKL/PKPS/PSL.0/8/2018 tanggal 3 Agustus 2018	2018	Izin	\N	\N	374.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
251	251	249	1	0101000020E61000006C787AA52CDF5F40D3BCE3141DC9F53F	\N	SK.8829/MENLHK-PSKL/PKPS/PSL.0/12/2021 tanggal 24 Desember 2021	2021	Izin	\N	\N	570.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
252	252	250	1	0101000020E61000000A68226C78DA5F40DBF97E6ABC74F13F	\N	SK.7899/MENLHK-PSKL/PKPS/PSL.0/10/2022 tanggal 7 Oktober 2022	2022	Izin	\N	\N	61.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
253	253	251	1	0101000020E6100000FB5C6DC5FEDE5F40E7FBA9F1D24DF13F	\N	SK.7906/MENLHK-PSKL/PKPS/PSL.0/10/2022 tanggal 7 Oktober 2022	2022	Izin	\N	\N	1660.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
254	254	252	1	0101000020E6100000B6114F7633EB5F405DA8FC6B7965F83F	\N	SK.1549/MENLHK-PSKL/PKPS/PSL.0/3/2021 tanggal 30 maret 2021	2021	Izin	\N	\N	245.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
255	255	253	1	0101000020E610000066A19DD32CE15F40130D52F014F2FA3F	\N	SK.4744/MENLHK-PSKL/PKPS/PSL.0/05/2019 tanggal 13 Mei 2019	2019	Izin	\N	\N	737.00	0.00	t	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
256	256	254	1	0101000020E61000000E2DB29DEFDF5F40BE30992A1895F23F	\N	SK.8013/MENLHK-PSKL/PKPS/PSL.0/2022 tanggal 17 Oktober 2022	2022	Izin	\N	\N	873.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
257	257	255	1	0101000020E610000084D4EDEC2BE75F40A8531EDD088BEB3F	\N	SK.8176/MENLHK-PSKL/PKTHA/PSL.1/10/2022 tanggal 20 Oktober 2022	2022	Izin	\N	\N	127.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
258	258	256	1	0101000020E610000066D828EB37E05F4047E350BF0B5BEC3F	\N	SK.7613/MENLHK-PSKL/PKTHA/PSL.1/9/2022 tanggal 30 September 2022	2022	Izin	\N	\N	229.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
259	259	257	1	0101000020E61000006FF607CA6DDE5F4074ED0BE8853BE3BF	\N	SK. 127/MENLHK-PSKL/PKPS/PSL.0/1/2018 tanggal 24 Januari 2018	2018	Izin	\N	\N	536.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
260	260	258	2	0101000020E610000047CA1649BBDE5F40BF81C98D22ABF23F	\N	SK. 1489/MENLHK-PSKL/PKPS/PSL.0/4/2018 tanggal 5 April 2018	2018	Izin	\N	\N	150.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
261	261	259	1	0101000020E6100000CF66D5E76ADF5F40D93D7958A835F03F	\N	SK.8476/MENLHK-PSKL/PKPS/PSL.0/12/2021 tanggal 24 Desember 2021	2021	Izin	\N	\N	344.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
262	262	260	1	0101000020E61000001E166A4DF3DA5F40A245B6F3FDD4F03F	\N	SK.1555/MENLHK-PSKL/PKPS/PSL.0/3/2021 tanggal 30 maret 2021	2021	Izin	\N	\N	76.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
263	263	261	2	0101000020E6100000D046AE9B52DA5F40BC5CC4776256F33F	\N	SK.7775/MENLHK-PSKL/PKTHA/PSL.1/10/2022 tanggal 3 Oktober 2022	2022	Izin	\N	\N	715.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
264	264	262	1	0101000020E61000002F36AD1402DB5F40F6EE8FF7AA15F43F	\N	SK.8149/MENLHK-PSKL/PKTHA/PSL.1/10/2022 tanggal 20 Oktober 2022	2022	Izin	\N	\N	484.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
265	265	263	1	0101000020E6100000FDF84B8BFAE75F40CBA145B6F3FDE83F	\N	SK.7895/MENLHK-PSKL/PKPS/PSL.0/10/2022 tanggal 7 Oktober 2022	2022	Izin	\N	\N	1248.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
266	266	264	1	0101000020E610000051A04FE449E55F40A835CD3B4E51F73F	\N	SK.8165/MENLHK-PSKL/PKTHA/PSL.1/10/2022 tanggal 20 Oktober 2022	2022	Izin	\N	\N	835.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
267	267	265	1	0101000020E61000003A92CB7F48DF5F409B559FABADD8F53F	\N	SK.8475/MENLHK-PSKL/PKPS/PSL.0/12/2021 tanggal 24 Desember 2021	2021	Izin	\N	\N	226.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
268	268	266	1	0101000020E610000079AF5A99F0EA5F40AC3B16DBA462F83F	\N	SK. 10279/MENLHK-PSKL/PKPS/PSL.0/12/2019 tanggal 20 Desember 2019	2019	Izin	\N	\N	245.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
269	269	267	1	\N	\N	SK.9911/MENLHK-PSKL/PKPS/PSL.0/9/2023	2023	Izin	\N	\N	661.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
270	270	268	1	0101000020E6100000DEAB5626FCE65F403291D26C1E47FB3F	\N	SK.8154/MENLHK-PSKL/PKTHA/PSL.1/10/2022 tanggal 20 Oktober 2022	2022	Izin	\N	\N	1708.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
271	271	269	1	\N	\N	8512 TAHUN 2024 tanggal 10 Juni 2024	2024	Izin	\N	\N	395.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
272	272	270	2	\N	\N	8510 TAHUN 2024 tanggal 10 Juni 2024\t	2024	Izin	\N	\N	174.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
273	273	271	1	\N	\N	8324 TAHUN 2024 tanggal 10 Juni 2024	2024	Izin	\N	\N	1822.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
274	274	272	1	\N	\N	8327 TAHUN 2024 tanggal 10 Juni 2024	2024	Izin	\N	\N	1680.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
275	275	273	1	\N	\N	8141 TAHUN 2024 tanggal 4 Juni 2024	2024	Izin	\N	\N	1611.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
276	276	274	1	\N	\N	8513 TAHUN 2024 tanggal 10 Juni 2024\t	2024	Izin	\N	\N	940.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
277	277	275	1	\N	\N	8515 TAHUN 2024 tanggal 10 Juni 2024\t	2024	Izin	\N	\N	664.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
278	278	276	1	\N	\N	8516 TAHUN 2024 tanggal 10 Juni 2024\t	2024	Izin	\N	\N	758.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
279	279	277	1	\N	\N	8143 TAHUN 2024 tanggal 5 Juni 2024	2024	Izin	\N	\N	875.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
280	280	278	1	\N	\N	8514 TAHUN 2024 tanggal 10 Juni 2024	2024	Izin	\N	\N	564.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
281	281	279	1	\N	\N	8509 TAHUN 2024 tanggal 10 Juni 2024	2024	Izin	\N	\N	499.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
282	282	280	1	\N	\N	8140 TAHUN 2024 tanggal 4 Juni 2024	2024	Izin	\N	\N	142.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
283	283	281	1	0101000020E6100000B07119116E8DF53F8D85D7E4DFE55F40	\N	SK.3682/MENLHK-PSKL/PKPS/PSL.0/4/2022	2022	Izin	\N	\N	142.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
284	284	282	1	0101000020E610000039B4C876BEDF5F40E5F21FD26F5FF63F	\N	SK.8470/MENLHK-PSKL/PKPS/PSL.0/12/2021 tanggal 24 Desember 2021	2021	Izin	\N	\N	339.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
285	285	283	1	0101000020E61000001E1A16A3AEDC5F4045D8F0F44AD9F03F	\N	SK.1153/MENLHK-PSKL/PKPS/PSL.0/3/2021 tanggal 24 maret 2021	2021	Izin	\N	\N	166.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
286	286	284	1	0101000020E6100000E38DCC237FDA5F40526518778368F13F	\N	SK.1946/Menlhk-PSKL/PKPS/PSL.0/4/2017 tanggal 4 April 2017	2017	Izin	\N	\N	145.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
287	287	285	2	0101000020E6100000EBC4E57805E05F40797764AC36BFF23F	\N	SK. 4057/MENLHK-PSKL/PKPS/PSL.0/6/2018 tanggal 22 Juni 2018	2018	Izin	\N	\N	300.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
288	288	286	2	0101000020E61000004ED1915CFEE05F404609FA0B3D62EE3F	\N	SK. 3932/MENLHK-PSKL/PKPS/PSL.0/6/2018 tanggal 7 Juni 2018	2018	Izin	\N	\N	400.00	0.00	t	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
289	289	287	2	0101000020E61000006C7A50508AE15F402942EA76F6D5F63F	\N	SK. 4018/MENLHK-PSKL/PKPS/PSL.0/4/2019 tanggal 23 April 2019	2019	Izin	\N	\N	637.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
290	290	288	1	\N	\N	SK.10343/MENLHK-PSKL/PKTHA/PSL.1/12/2022 tanggal 27 Desember 2022	2022	Izin	\N	\N	468.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
291	291	289	2	0101000020E6100000C37FBA8102E05F40B1E1E995B2CCF23F	\N	SK. 1490/MENLHK-PSKL/PKPS/PSL.0/4/2018 tanggal 5 April 2018	2018	Izin	\N	\N	45.00	0.00	t	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
292	292	290	1	0101000020E6100000E5ED08A705E05F4002BB9A3C65B5F23F	\N	SK. 9779/MENLHK-PSKL/PKPS/PSL.0/11/2019 tanggal 26 November 2019	2019	Izin	\N	\N	1200.00	0.00	t	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
293	293	291	2	0101000020E6100000EA76F69507E05F40F2608BDD3EABF23F	\N	SK. 3932/MENLHK-PSKL/PKPS/PSL.0/6/2018 tanggal 7 Juni 2018	2018	Izin	\N	\N	445.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
294	294	292	1	\N	\N	8511 TAHUN 2024 tanggal 10 Juni 2024	2024	Izin	\N	\N	239.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
295	295	293	1	0101000020E6100000AA8251499DE45F401CEBE2361AC0F73F	\N	SK.8471/MENLHK-PSKL/PKPS/PSL.0/12/2021 tanggal 24 Desember 2021	2021	Izin	\N	\N	1287.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
296	296	294	1	0101000020E61000002CD49AE61DDF5F40F46C567DAEB6F53F	\N	SK.8477/MENLHK-PSKL/PKPS/PSL.0/12/2021 tanggal 24 Desember 2021	2021	Izin	\N	\N	736.00	0.00	t	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
297	297	295	1	0101000020E6100000EA4141295ADF5F408BFF3BA242F5F53F	\N	SK.7489/MENLHK-PSKL/PKPS/PSL.0/9/2022 tanggal 26 September 2022	2022	Izin	\N	\N	513.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
298	298	296	1	0101000020E61000003CA1D79FC4E25F408F71C5C551F9F63F	\N	SK.7896/MENLHK-PSKL/PKPS/PSL.0/10/2022 tanggal 7 Oktober 2022	2022	Izin	\N	\N	1380.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
299	299	297	1	0101000020E61000007653CA6B25DE5F407E022846960CF53F	\N	SK.1148/MENLHK-PSKL/PKPS/PSL.0/3/2021 tanggal 24 maret 2021	2021	Izin	\N	\N	914.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
300	300	298	1	0101000020E610000015AA9B8BBFE25F40363CBD529661F43F	\N	SK.1945/Menlhk-PSKL/PKPS/PSL.0/4/2017 tanggal 4 April 2017	2017	Izin	\N	\N	150.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
301	301	299	1	0101000020E6100000ADC266800BE95F40A94A5B5CE3B3F83F	\N	SK. 10502/MENLHK-PSKL/PKPS/PSL.0/12/2019 tanggal 27 Desember 2019	2019	Izin	\N	\N	111.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
302	302	300	1	0101000020E6100000CF12640454EC5F40F31E679AB0BDF73F	\N	SK. 10490/MENLHK-PSKL/PKPS/PSL.0/12/2019 tanggal 27 Desember 2019	2019	Izin	\N	\N	272.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
303	303	301	1	0101000020E61000005F09A4C4AEDE5F40DA3C0E83F9EBF13F	\N	SK.5126/MENLHK-PSKL/PKPS/PSL.0/6/2022 tanggal 13 Juni 2022	2022	Izin	\N	\N	1237.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
304	304	302	2	0101000020E610000080D591239DDE5F40C217265305A3F23F	\N	SK.2840/MENLHK-PSKL/PKPS/PSL.0/3/2022 tanggal 28 Maret 2022	2022	Izin	\N	\N	167.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
305	305	303	1	0101000020E61000004703780B24E05F4061C3D32B6519F13F	\N	SK.8469/MENLHK-PSKL/PKPS/PSL.0/12/2021 tanggal 24 Desember 2021	2021	Izin	\N	\N	528.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
306	306	304	1	0101000020E61000007F68E6C935E05F401F2FA4C34398EF3F	\N	SK.8155/MENLHK-PSKL/PKTHA/PSL.1/10/2022 tanggal 20 Oktober 2022	2022	Izin	\N	\N	493.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
307	307	305	1	0101000020E61000008FE4F21FD2DF5F401AC05B2041F1F03F	\N	SK.8474/MENLHK-PSKL/PKPS/PSL.0/12/2021 tanggal 24 Desember 2021	2021	Izin	\N	\N	495.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
308	308	306	1	0101000020E61000006B7F677BF4E65F407BDB4C8578A4EC3F	\N	SK.8014/MENLHK-PSKL/PKPS/PSL.0/10/2022 tanggal 17 Oktober 2022	2022	Izin	\N	\N	134.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
309	309	307	2	0101000020E610000078D4981073E95F4052EDD3F19881EB3F	\N	SK.2841/MENLHK-PSKL/PKPS/PSL.0/3/2022 tanggal 28 Maret 2022	2022	Izin	\N	\N	418.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
310	310	308	1	0101000020E610000007F0164850E85F40C898BB96900FEC3F	\N	SK.8473/MENLHK-PSKL/PKPS/PSL.0/12/2021 tanggal 24 Desember 2021	2021	Izin	\N	\N	95.00	0.00	t	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
311	311	309	1	0101000020E610000004392861A6EDEC3F42D0D1AA96E15F40	\N	SK.7619/MENLHK-PSKL/PKPS/PSL.0/9/2022 tanggal 30 September 2022	2022	Izin	\N	\N	252.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
312	312	310	1	0101000020E61000002AE620E868EB5F40C2A6CEA3E27FE93F	\N	SK.3430/MENLHK-PSKL/PKPS/PSL.0/4/2022 tanggal 13 April 2022	2022	Izin	\N	\N	470.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
313	313	311	1	0101000020E61000009EEFA7C64BE95F40B08C0DDDEC0FE93F	\N	SK.7904/MENLHK-PSKL/PKPS/PSL.0/10/2022 tanggal 7 Oktober 2022	2022	Izin	\N	\N	315.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
314	314	312	1	0101000020E610000005323B8BDEE85F407B87DBA16131EA3F	\N	SK.10344/MENLHK-PSKL/PKTHA/PSL.1/12/2022 tanggal 23 Desember 2022	2022	Izin	\N	\N	608.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
315	315	313	1	0101000020E6100000A7FDFEA810E95F406EDEE7E1CC2FF93F	\N	SK.9950/MENLHK-PSKL/PKTHA/PSL.1/12/2022 tanggal 15 Desember 2022	2022	Izin	\N	\N	2608.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
316	316	314	3	\N	\N	SK. No 60 Tahun 2010 tanggal 06 April 2010	2010	Izin	\N	\N	7010.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
317	317	315	1	0101000020E6100000D82D02637DE95F40658A39083A5AF03F	\N	SK.4501/MENLHK-PSKL/PKPS/PSL.0/5/2022 tanggal 27 Mei 2022	2022	Izin	\N	\N	193.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
318	318	316	1	0101000020E6100000647616BD53EA5F40FE75C2D91AC2EB3F	\N	SK.8008/MENLHK-PSKL/PKPS/PSL.0/10/2022 tanggal 17 Oktober 2022	2022	Izin	\N	\N	875.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
319	319	317	1	0101000020E6100000B75ED38382E65F40861DC6A4BF17FB3F	\N	SK. 5323/MENLHK-PSKL/PKPS/PSL.0/5/2019 tanggal 31 Mei 2019	2019	Izin	\N	\N	1039.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
320	320	318	1	0101000020E6100000F9D9C87553E65F40A27F828B1535FB3F	\N	SK. 5328/MENLHK-PSKL/PKPS/PSL.0/5/2019 tanggal 31 Mei 2019	2019	Izin	\N	\N	698.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
321	321	319	1	0101000020E61000005BB1BFEC9EE85F4016FBCBEEC9C3F83F	\N	SK.8472/MENLHK-PSKL/PKPS/PSL.0/12/2021 tanggal 24 Desember 2021	2021	Izin	\N	\N	103.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
322	322	320	1	0101000020E6100000BEC1172653DD5F4046B6F3FDD478F23F	\N	SK.8831/MENLHK-PSKL/PKPS/PSL.0/12/2021 tanggal 31 Desember 2021	2021	Izin	\N	\N	514.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
323	323	321	1	0101000020E6100000A51133FB3CDA5F40D00CE2033BFEF23F	\N	SK.8011/MENLHK-PSKL/PKPS/PSL.0/10/2022 tanggal 17 Oktober 2022	2022	Izin	\N	\N	233.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
324	324	322	1	0101000020E6100000C59107228BDB5F40A46E675F7950F43F	\N	SK.7874/MENLHK-PSKL/PKPS/PSL.0/10/2022 tanggal 6 Oktober 2022	2022	Izin	\N	\N	712.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
325	325	323	1	0101000020E6100000C59107228BDB5F4026E4AE1E2A27F43F	\N	SK.8016/MENLHK-PSKL/PKPS/PSL.0/10/2022 tanggal 17 Oktober 2022	2022	Izin	\N	\N	641.00	0.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
326	326	324	1	0101000020E6100000DE718A8EE4DE5F409D8026C286A7F23F	\N	SK.8463/MENLHK-PSKL/PKPS/PSL.0/12/2021 tanggal 24 Desember 2021	2021	Izin	\N	\N	568.00	0.00	t	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
327	327	325	1	0101000020E6100000FA7E6ABC74DF5F40F7E461A1D634F23F	\N	SK.8464/MENLHK-PSKL/PKPS/PSL.0/12/2021 tanggal 24 Desember 2021	2021	Izin	\N	\N	527.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
328	328	326	1	0101000020E6100000CF66D5E76ADF5F40DC114E0B5E34F23F	\N	SK. 5121/MENLHK-PSKL/PKPS/PSL.0/6/2022 tanggal 13 Juni 2022	2022	Izin	\N	\N	736.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
1	1	1	1	0101000020E610000000000000000014400000000000001840	0103000020E61000000100000005000000F6285C8FC2F51340F6285C8FC2F517400AD7A3703D0A1440F6285C8FC2F517400AD7A3703D0A14400AD7A3703D0A1840F6285C8FC2F513400AD7A3703D0A1840F6285C8FC2F51340F6285C8FC2F51740	20	23	22	\N	\N	25.00	26.00	f	f	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-16 03:02:04.803+07
10	10	10	2	0101000020E61000005839B4C876D75F40670B08AD87AFE73F	0103000020E61000000100000005000000E7FBA9F1D2D65F401553E9279C5DE73FC976BE9F1AD85F401553E9279C5DE73FC976BE9F1AD85F40B9C326327301E83FE7FBA9F1D2D65F40B9C326327301E83FE7FBA9F1D2D65F401553E9279C5DE73F	SK. 10424/MENLHK-PSKL/PKPS/PSL.0/12/2019 tanggal 26 Desember 2019	71	2019	\N	\N	0.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-16 03:02:04.818+07
13	13	13	1	0101000020E6100000416667D13BDA5F40D9CC21A98592E23F	0103000020E61000000100000005000000D0285DFA97D95F40871403249A40E23FB2A371A8DFDA5F40871403249A40E23FB2A371A8DFDA5F402B85402E71E4E23FD0285DFA97D95F402B85402E71E4E23FD0285DFA97D95F40871403249A40E23F	SK. 10089/MENLHK-PSKL/PKPS/PSL.0/12/2019 tanggal 13 Desember 2019	227	2019	\N	\N	0.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-16 03:02:04.821+07
15	15	15	1	0101000020E61000006A12BC218DD85F4061C3D32B6519E23F	0103000020E61000000100000005000000F9D4B14AE9D75F400F0BB5A679C7E13FDB4FC6F830D95F400F0BB5A679C7E13FDB4FC6F830D95F40B37BF2B0506BE23FF9D4B14AE9D75F40B37BF2B0506BE23FF9D4B14AE9D75F400F0BB5A679C7E13F	SK. 9994/MENLHK-PSKL/PKPS/PSL.0/12/2019 tanggal 06 Desember 2019	179	2019	\N	\N	0.00	0.00	f	t	f	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-16 03:02:04.823+07
20	20	20	2	0101000020E61000009BE447FC8ADB5F407A8D5DA27AEBE73F	0103000020E610000001000000050000002AA73D25E7DA5F4028D53E1D8F99E73F0C2252D32EDC5F4028D53E1D8F99E73F0C2252D32EDC5F40CC457C27663DE83F2AA73D25E7DA5F40CC457C27663DE83F2AA73D25E7DA5F4028D53E1D8F99E73F	SK. 9352/MENLHK-PSKL/PKPS/PSL.0/11/2019 tanggal 05 November 2019	56	2019	\N	\N	0.00	0.00	t	t	t	f	\N	\N	\N	\N	2026-02-15 09:46:24.808271+07	2026-02-16 03:02:04.826+07
\.


--
-- Data for Name: SupplyChainNodes; Type: TABLE DATA; Schema: public; Owner: hutan_kita_user
--

COPY public."SupplyChainNodes" (id, "commodityId", "nodeType", name, location, "orderInChain", "marginPercent", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: SystemConfig; Type: TABLE DATA; Schema: public; Owner: hutan_kita_user
--

COPY public."SystemConfig" (id, key, value, description, "createdAt", "updatedAt") FROM stdin;
1	scoring_weights	{"sdm": 0.15, "legal": 0.15, "market": 0.15, "commodity": 0.15, "composite": 1, "biophysical": 0.15, "environment": 0.15}	Bobot penilaian untuk setiap aspek	2026-02-16 02:40:43.198+07	2026-02-16 02:40:43.198+07
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: hutan_kita_user
--

COPY public."Users" (id, email, "passwordHash", "fullName", role, phone, "isActive", "lastLoginAt", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Villages; Type: TABLE DATA; Schema: public; Owner: hutan_kita_user
--

COPY public."Villages" (id, "districtId", name, code, "createdAt", "updatedAt") FROM stdin;
1	1	15	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
2	2	Kususinopa	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
3	2	Lifofa	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
4	2	Nuku	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
5	2	Selamalofo	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
6	2	Sigela Yef	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
7	2	Tagalaya	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
8	3	Toseho	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
9	2	Wama	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
10	4	Maitara	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
11	5	Aketobololo	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
12	6	Koli	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
13	7	Maregam	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
14	6	Gita Raja	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
15	7	Marekofo	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
16	8	Guraping	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
17	6	Kosa	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
18	4	Kelurahan Jaya	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
19	4	Afa-afa	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
20	9	Mafututu	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
21	5	Tadupi	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
22	6	Talasi	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
23	5	Tauno	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
24	6	Woda	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
25	10	Foramadiahi	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
26	11	Moya	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
27	11	Marikurubu	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
28	12	Dorari Isa	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
29	13	Afe Taduma	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
30	10	Tobololo	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
31	11	Maliaro	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
32	14	Tubo	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
33	15	Tadenas	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
34	15	Tafamutu	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
35	16	Kulaba	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
36	17	Bido	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
37	15	Tafaga	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
38	17	Lelewi	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
39	12	Mado	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
40	17	Mayau	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
41	15	Moti	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
42	16	Togafo	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
43	15	Takofi	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
44	16	Takome	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
45	18	Sangaji Jaya	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
46	18	Bori	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
47	19	Bukit Tinggi	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
48	20	Makaeling	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
49	18	Wateto	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
50	21	Gorua Utara	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
51	22	Simau	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
52	23	Mkcm	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
53	24	Togawa Dan Togawa Besi	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
54	24	Soakonora	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
55	25	Popon	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
56	26	Momoda	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
57	18	Bobale	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
58	18	Daru	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
59	27	Talaga Paca	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
60	28	Efi-efi	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
61	29	Roko	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
62	30	Jikolamo	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
63	30	Tobo-tobo	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
64	22	Mamuya	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
65	22	Pune	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
66	29	Samuda	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
67	29	Soatabaru	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
68	31	Jere Tua	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
69	31	Saluta	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
70	31	Tutumaloleo	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
71	25	Sumber Agung	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
72	26	Gagaapok	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
73	26	Ngoali	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
74	26	Soahukum	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
75	26	Soamaetek	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
76	26	Tolabit	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
77	26	Toliwang	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
78	20	Akelamo Kao	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
79	18	Boulamo	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
80	30	Cera	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
81	30	Dagasuli	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
82	30	Dedeta	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
83	30	Dowonggila	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
84	30	Fitako	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
85	30	Salube	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
86	32	Doitia	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
87	32	Pocoa	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
88	32	Podol	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
89	32	Teru-teru	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
90	32	Woro Moi	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
91	19	Gayok	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
92	19	Tabobo	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
93	19	Tafasoho	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
94	23	Gamsungi	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
95	23	Gosoma	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
96	23	Lemah Ino	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
97	23	Kakara	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
98	23	Tagalaya	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
99	23	Wari	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
100	23	Wari Ino	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
101	33	Wangongira	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
102	27	Gamhoku	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
103	27	Kupa-kupa Dan Kupa-kupa Selatan	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
104	27	Pale	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
105	27	Tioua	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
106	34	Kalipitu	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
107	34	Pitu	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
108	21	Kokota Jaya	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
109	21	Popilo	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
110	21	Ruko	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
111	21	Tolonuo	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
112	21	Tolonuo Selatan	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
113	35	Soa Sangaji	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
114	36	Buli Karya	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
115	36	Teluk Buli	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
116	37	Sowoli	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
117	38	Bangul	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
118	39	Dakaino	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
119	35	Soa Laipoh	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
120	39	Tutuling Jaya	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
121	40	Foli	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
122	41	Gulapapo	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
123	41	Subaim	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
124	42	Wasile	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
125	42	Saramaake	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
126	42	Nanas	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
127	42	Bukutio, Fayaul	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
128	39	Dodaga	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
129	43	Hilaitetor	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
130	35	Wailukum	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
131	44	Buli	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
132	44	Buli Asal	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
133	44	Geltoli	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
134	44	Sailal	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
135	44	Wayafli	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
136	37	Bicoli	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
137	37	Waci	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
138	45	Wasileo	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
139	40	Lolobata	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
140	46	Air Salobar	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
141	47	Damuli	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
142	48	Dotte	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
143	47	Masure	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
144	47	Nursifa	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
145	47	Peniti	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
146	47	Sakam	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
147	49	Waleh	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
148	46	Kluting Jaya	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
149	50	Banemo, Bobane Jaya, Bobane Indah	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
150	51	Kobe	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
151	51	Kulo Jaya	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
152	46	Lembah Asri	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
153	52	Moreala	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
154	53	Nusliko	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
155	46	Sosowomo	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
156	46	Sumber Sari	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
157	46	Tilope	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
158	46	Wairoro Indah	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
159	53	Were	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
160	48	Yeke	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
161	54	Balitata	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
162	55	Bibinoi	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
163	56	Gandasuli	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
164	57	Papaloang	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
165	56	Makian	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
166	55	Songa	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
167	58	Wayamiga	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
168	54	Oha	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
169	59	Talapaon	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
170	59	Bobawae	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
171	59	Sebelei	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
172	59	Mateketen	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
173	54	Papaceda	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
174	54	Saketa	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
175	54	Tabamasa	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
176	59	Tegono	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
177	59	Malapat	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
178	60	Marabose	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
179	61	-	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
180	58	Sabatang	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
181	58	Kaireu	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
182	58	Sayoang	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
183	60	Belang-belang	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
184	60	Amasing Kali	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
185	62	Baleha	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
186	63	Fuata Dan Waitamua	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
187	62	Sama	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
188	62	Waigoiyofa	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
189	64	Bega	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
190	64	Fat Iba	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
191	62	Fatkauyon	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
192	65	Fogi	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
193	66	Kabau Darat	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
194	64	Manaf	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
195	67	Naflow	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
196	66	Nahi	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
197	66	Ona	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
198	65	Pastina	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
199	68	Pohea	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
200	63	Sekom	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
201	64	Soamole	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
202	69	Wai Ina	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
203	65	Wai Ipa	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
204	64	Waiboga	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
205	63	Waigay	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
206	65	Waihama	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
207	65	Wailau	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
208	64	Waiman	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
209	63	Wainib	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
210	67	Waitina	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
211	68	Fukweu	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
212	65	Umaloya	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
213	68	Fokalik	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
214	70	Kawata	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
215	66	Paratina	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
216	66	Kabau Pantai	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
217	67	Kou	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
218	62	Wailia	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
219	68	Wainin	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
220	71	Parigi	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
221	71	Tubang	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
222	71	Samuya	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
223	72	Kenari	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
224	72	Lusuo	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
225	72	Tawakali	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
226	72	Bido	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
227	73	Cendana	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
228	72	Gorua	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
229	74	Daeo Dan Daeo Majiko	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
230	74	Tutuhu	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
231	75	Wewemo	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
232	75	Mira, Doku Mira, Rahmat	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
233	73	Aru	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
234	73	Gorugo	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
235	72	Korago	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
236	73	Towara	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
237	76	Wayabula Dan Bobula	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
238	72	Bere Bere, Sakita, Tanjung Saleh, Loleo Jaya	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
239	75	Buho-buho, Seseli Jaya, Lifao, Hino	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
240	73	Sopi Dan Sopi Majiko	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
241	77	Nakamura	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
242	76	Ngele-ngele Kecil	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
243	78	-	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
244	76	Raja	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
245	72	Yao	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
246	79	Ulo	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
247	80	Adu	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
248	81	Tataleka	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
249	80	Baru	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
250	79	Idamdehe Gamsungi	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
251	79	Porniti	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
252	82	Pasalulu	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
253	83	Kahatola	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
254	84	Tibobo	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
255	85	Akelaha	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
256	85	Sidangoli Dehe	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
257	79	Tuada	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
258	86	Tacici	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
259	79	Matui	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
260	79	Payo	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
261	86	Peot	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
262	86	Sasur	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
263	79	Rioribati	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
264	87	Naga	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
265	80	Gamsida	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
266	82	Tolisaor	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
267	85	Tetewang Joronga	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
268	88	Jano	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
269	87	Maritango	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
270	85	Hijrah	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
271	83	Kedi	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
272	83	Tasye	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
273	83	Tuguis	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
274	88	Bakun Pantai	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
275	88	Barataku	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
276	88	Gamkahe	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
277	88	Pumadada	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
278	88	Tosomolo	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
279	89	Aru Jaya	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
280	89	Togoreba Sungi	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
281	85	Tuguraci	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
282	80	Jere	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
283	79	Bobanehena	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
284	79	Idam Dehe	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
285	84	Ngaon	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
286	85	Gamlenge	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
287	80	Talaga	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
288	80	Nanas	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
289	84	Gamsungi	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
290	84	Campaka	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
291	90	Gamnyial	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
292	85	Suka Damai	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
293	87	Kie Ici	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
294	80	Ngalo-ngalo	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
295	80	Ngawet	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
296	80	Sarau	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
297	80	Tabobol	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
298	80	Tosoa	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
299	82	Borona	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
300	82	Togereba Tua	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
301	79	Akediri	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
302	86	Worat-worat	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
303	79	Bukumatiti	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
304	79	Tauro	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
305	79	Todowongi	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
306	85	Akeara	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
307	85	Dodinga	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
308	85	Bangkit Rahmat	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
309	85	Domato	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
310	85	Braha	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
311	85	Tabadamai	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
312	85	Tewe	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
313	91	Akelamo Kao	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
314	92	-	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
315	91	Akesahu Gamsungi	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
316	91	Bobaneigo	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
317	83	Laba Besar	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
318	83	Laba Kecil	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
319	89	Tuguis	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
320	86	Balisoan Utara	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
321	86	Dere	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
322	86	Goro-goro	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
323	86	Sasur Pantai	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
324	86	Taraudu	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
325	84	Awer	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
326	90	Aketola	\N	2026-02-15 09:46:24.808271+07	2026-02-15 09:46:24.808271+07
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: macbooksale
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Name: BiophysicalProfiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hutan_kita_user
--

SELECT pg_catalog.setval('public."BiophysicalProfiles_id_seq"', 50, true);


--
-- Name: BusinessReadiness_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hutan_kita_user
--

SELECT pg_catalog.setval('public."BusinessReadiness_id_seq"', 50, true);


--
-- Name: Buyers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hutan_kita_user
--

SELECT pg_catalog.setval('public."Buyers_id_seq"', 5, true);


--
-- Name: CarryingCapacity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hutan_kita_user
--

SELECT pg_catalog.setval('public."CarryingCapacity_id_seq"', 50, true);


--
-- Name: Commodities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hutan_kita_user
--

SELECT pg_catalog.setval('public."Commodities_id_seq"', 144, true);


--
-- Name: CommoditySuitabilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hutan_kita_user
--

SELECT pg_catalog.setval('public."CommoditySuitabilities_id_seq"', 50, true);


--
-- Name: DerivedProducts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hutan_kita_user
--

SELECT pg_catalog.setval('public."DerivedProducts_id_seq"', 24, true);


--
-- Name: Districts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hutan_kita_user
--

SELECT pg_catalog.setval('public."Districts_id_seq"', 92, true);


--
-- Name: EnvironmentalRisks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hutan_kita_user
--

SELECT pg_catalog.setval('public."EnvironmentalRisks_id_seq"', 17, true);


--
-- Name: ForestAreaStatuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hutan_kita_user
--

SELECT pg_catalog.setval('public."ForestAreaStatuses_id_seq"', 23, true);


--
-- Name: GroupDemographics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hutan_kita_user
--

SELECT pg_catalog.setval('public."GroupDemographics_id_seq"', 50, true);


--
-- Name: InstitutionContacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hutan_kita_user
--

SELECT pg_catalog.setval('public."InstitutionContacts_id_seq"', 289, true);


--
-- Name: InstitutionMembers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hutan_kita_user
--

SELECT pg_catalog.setval('public."InstitutionMembers_id_seq"', 310, true);


--
-- Name: InstitutionTypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hutan_kita_user
--

SELECT pg_catalog.setval('public."InstitutionTypes_id_seq"', 7, true);


--
-- Name: Institutions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hutan_kita_user
--

SELECT pg_catalog.setval('public."Institutions_id_seq"', 328, true);


--
-- Name: LandCoverTypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hutan_kita_user
--

SELECT pg_catalog.setval('public."LandCoverTypes_id_seq"', 5, true);


--
-- Name: MarketData_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hutan_kita_user
--

SELECT pg_catalog.setval('public."MarketData_id_seq"', 50, true);


--
-- Name: MonitoringLogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hutan_kita_user
--

SELECT pg_catalog.setval('public."MonitoringLogs_id_seq"', 1, false);


--
-- Name: PSSchemes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hutan_kita_user
--

SELECT pg_catalog.setval('public."PSSchemes_id_seq"', 6, true);


--
-- Name: PermitCommodities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hutan_kita_user
--

SELECT pg_catalog.setval('public."PermitCommodities_id_seq"', 1203, true);


--
-- Name: PermitForestStatuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hutan_kita_user
--

SELECT pg_catalog.setval('public."PermitForestStatuses_id_seq"', 458, true);


--
-- Name: PermitLandCovers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hutan_kita_user
--

SELECT pg_catalog.setval('public."PermitLandCovers_id_seq"', 150, true);


--
-- Name: PriorityScores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hutan_kita_user
--

SELECT pg_catalog.setval('public."PriorityScores_id_seq"', 50, true);


--
-- Name: ProductionRecords_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hutan_kita_user
--

SELECT pg_catalog.setval('public."ProductionRecords_id_seq"', 1, false);


--
-- Name: ProtectedZones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hutan_kita_user
--

SELECT pg_catalog.setval('public."ProtectedZones_id_seq"', 1, false);


--
-- Name: Provinces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hutan_kita_user
--

SELECT pg_catalog.setval('public."Provinces_id_seq"', 2, true);


--
-- Name: Regencies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hutan_kita_user
--

SELECT pg_catalog.setval('public."Regencies_id_seq"', 11, true);


--
-- Name: SocialForestPermits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hutan_kita_user
--

SELECT pg_catalog.setval('public."SocialForestPermits_id_seq"', 328, true);


--
-- Name: SupplyChainNodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hutan_kita_user
--

SELECT pg_catalog.setval('public."SupplyChainNodes_id_seq"', 1, false);


--
-- Name: SystemConfig_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hutan_kita_user
--

SELECT pg_catalog.setval('public."SystemConfig_id_seq"', 1, true);


--
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hutan_kita_user
--

SELECT pg_catalog.setval('public."Users_id_seq"', 1, false);


--
-- Name: Villages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hutan_kita_user
--

SELECT pg_catalog.setval('public."Villages_id_seq"', 326, true);


--
-- Name: BiophysicalProfiles BiophysicalProfiles_permitId_key; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."BiophysicalProfiles"
    ADD CONSTRAINT "BiophysicalProfiles_permitId_key" UNIQUE ("permitId");


--
-- Name: BiophysicalProfiles BiophysicalProfiles_pkey; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."BiophysicalProfiles"
    ADD CONSTRAINT "BiophysicalProfiles_pkey" PRIMARY KEY (id);


--
-- Name: BusinessReadiness BusinessReadiness_institutionId_key; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."BusinessReadiness"
    ADD CONSTRAINT "BusinessReadiness_institutionId_key" UNIQUE ("institutionId");


--
-- Name: BusinessReadiness BusinessReadiness_pkey; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."BusinessReadiness"
    ADD CONSTRAINT "BusinessReadiness_pkey" PRIMARY KEY (id);


--
-- Name: Buyers Buyers_pkey; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."Buyers"
    ADD CONSTRAINT "Buyers_pkey" PRIMARY KEY (id);


--
-- Name: CarryingCapacity CarryingCapacity_permitId_key; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."CarryingCapacity"
    ADD CONSTRAINT "CarryingCapacity_permitId_key" UNIQUE ("permitId");


--
-- Name: CarryingCapacity CarryingCapacity_pkey; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."CarryingCapacity"
    ADD CONSTRAINT "CarryingCapacity_pkey" PRIMARY KEY (id);


--
-- Name: Commodities Commodities_name_key; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."Commodities"
    ADD CONSTRAINT "Commodities_name_key" UNIQUE (name);


--
-- Name: Commodities Commodities_pkey; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."Commodities"
    ADD CONSTRAINT "Commodities_pkey" PRIMARY KEY (id);


--
-- Name: CommoditySuitabilities CommoditySuitabilities_pkey; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."CommoditySuitabilities"
    ADD CONSTRAINT "CommoditySuitabilities_pkey" PRIMARY KEY (id);


--
-- Name: DerivedProducts DerivedProducts_pkey; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."DerivedProducts"
    ADD CONSTRAINT "DerivedProducts_pkey" PRIMARY KEY (id);


--
-- Name: Districts Districts_pkey; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."Districts"
    ADD CONSTRAINT "Districts_pkey" PRIMARY KEY (id);


--
-- Name: EnvironmentalRisks EnvironmentalRisks_pkey; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."EnvironmentalRisks"
    ADD CONSTRAINT "EnvironmentalRisks_pkey" PRIMARY KEY (id);


--
-- Name: ForestAreaStatuses ForestAreaStatuses_code_key; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."ForestAreaStatuses"
    ADD CONSTRAINT "ForestAreaStatuses_code_key" UNIQUE (code);


--
-- Name: ForestAreaStatuses ForestAreaStatuses_pkey; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."ForestAreaStatuses"
    ADD CONSTRAINT "ForestAreaStatuses_pkey" PRIMARY KEY (id);


--
-- Name: GroupDemographics GroupDemographics_institutionId_key; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."GroupDemographics"
    ADD CONSTRAINT "GroupDemographics_institutionId_key" UNIQUE ("institutionId");


--
-- Name: GroupDemographics GroupDemographics_pkey; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."GroupDemographics"
    ADD CONSTRAINT "GroupDemographics_pkey" PRIMARY KEY (id);


--
-- Name: InstitutionContacts InstitutionContacts_pkey; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."InstitutionContacts"
    ADD CONSTRAINT "InstitutionContacts_pkey" PRIMARY KEY (id);


--
-- Name: InstitutionMembers InstitutionMembers_pkey; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."InstitutionMembers"
    ADD CONSTRAINT "InstitutionMembers_pkey" PRIMARY KEY (id);


--
-- Name: InstitutionTypes InstitutionTypes_code_key; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."InstitutionTypes"
    ADD CONSTRAINT "InstitutionTypes_code_key" UNIQUE (code);


--
-- Name: InstitutionTypes InstitutionTypes_pkey; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."InstitutionTypes"
    ADD CONSTRAINT "InstitutionTypes_pkey" PRIMARY KEY (id);


--
-- Name: Institutions Institutions_pkey; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."Institutions"
    ADD CONSTRAINT "Institutions_pkey" PRIMARY KEY (id);


--
-- Name: LandCoverTypes LandCoverTypes_code_key; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."LandCoverTypes"
    ADD CONSTRAINT "LandCoverTypes_code_key" UNIQUE (code);


--
-- Name: LandCoverTypes LandCoverTypes_pkey; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."LandCoverTypes"
    ADD CONSTRAINT "LandCoverTypes_pkey" PRIMARY KEY (id);


--
-- Name: MarketData MarketData_pkey; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."MarketData"
    ADD CONSTRAINT "MarketData_pkey" PRIMARY KEY (id);


--
-- Name: MonitoringLogs MonitoringLogs_pkey; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."MonitoringLogs"
    ADD CONSTRAINT "MonitoringLogs_pkey" PRIMARY KEY (id);


--
-- Name: PSSchemes PSSchemes_code_key; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."PSSchemes"
    ADD CONSTRAINT "PSSchemes_code_key" UNIQUE (code);


--
-- Name: PSSchemes PSSchemes_pkey; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."PSSchemes"
    ADD CONSTRAINT "PSSchemes_pkey" PRIMARY KEY (id);


--
-- Name: PermitCommodities PermitCommodities_pkey; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."PermitCommodities"
    ADD CONSTRAINT "PermitCommodities_pkey" PRIMARY KEY (id);


--
-- Name: PermitForestStatuses PermitForestStatuses_pkey; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."PermitForestStatuses"
    ADD CONSTRAINT "PermitForestStatuses_pkey" PRIMARY KEY (id);


--
-- Name: PermitLandCovers PermitLandCovers_pkey; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."PermitLandCovers"
    ADD CONSTRAINT "PermitLandCovers_pkey" PRIMARY KEY (id);


--
-- Name: PriorityScores PriorityScores_permitId_key; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."PriorityScores"
    ADD CONSTRAINT "PriorityScores_permitId_key" UNIQUE ("permitId");


--
-- Name: PriorityScores PriorityScores_pkey; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."PriorityScores"
    ADD CONSTRAINT "PriorityScores_pkey" PRIMARY KEY (id);


--
-- Name: ProductionRecords ProductionRecords_pkey; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."ProductionRecords"
    ADD CONSTRAINT "ProductionRecords_pkey" PRIMARY KEY (id);


--
-- Name: ProtectedZones ProtectedZones_pkey; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."ProtectedZones"
    ADD CONSTRAINT "ProtectedZones_pkey" PRIMARY KEY (id);


--
-- Name: Provinces Provinces_pkey; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."Provinces"
    ADD CONSTRAINT "Provinces_pkey" PRIMARY KEY (id);


--
-- Name: Regencies Regencies_pkey; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."Regencies"
    ADD CONSTRAINT "Regencies_pkey" PRIMARY KEY (id);


--
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- Name: SocialForestPermits SocialForestPermits_pkey; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."SocialForestPermits"
    ADD CONSTRAINT "SocialForestPermits_pkey" PRIMARY KEY (id);


--
-- Name: SupplyChainNodes SupplyChainNodes_pkey; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."SupplyChainNodes"
    ADD CONSTRAINT "SupplyChainNodes_pkey" PRIMARY KEY (id);


--
-- Name: SystemConfig SystemConfig_key_key; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."SystemConfig"
    ADD CONSTRAINT "SystemConfig_key_key" UNIQUE (key);


--
-- Name: SystemConfig SystemConfig_pkey; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."SystemConfig"
    ADD CONSTRAINT "SystemConfig_pkey" PRIMARY KEY (id);


--
-- Name: Users Users_email_key; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key" UNIQUE (email);


--
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- Name: Villages Villages_pkey; Type: CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."Villages"
    ADD CONSTRAINT "Villages_pkey" PRIMARY KEY (id);


--
-- Name: commodity_suitabilities_permit_id_commodity_id; Type: INDEX; Schema: public; Owner: hutan_kita_user
--

CREATE UNIQUE INDEX commodity_suitabilities_permit_id_commodity_id ON public."CommoditySuitabilities" USING btree ("permitId", "commodityId");


--
-- Name: priority_scores_composite_score; Type: INDEX; Schema: public; Owner: hutan_kita_user
--

CREATE INDEX priority_scores_composite_score ON public."PriorityScores" USING btree ("compositeScore");


--
-- Name: priority_scores_priority_category; Type: INDEX; Schema: public; Owner: hutan_kita_user
--

CREATE INDEX priority_scores_priority_category ON public."PriorityScores" USING btree ("priorityCategory");


--
-- Name: social_forest_permits_location; Type: INDEX; Schema: public; Owner: hutan_kita_user
--

CREATE INDEX social_forest_permits_location ON public."SocialForestPermits" USING gist (location);


--
-- Name: social_forest_permits_scheme_id; Type: INDEX; Schema: public; Owner: hutan_kita_user
--

CREATE INDEX social_forest_permits_scheme_id ON public."SocialForestPermits" USING btree ("schemeId");


--
-- Name: social_forest_permits_village_id; Type: INDEX; Schema: public; Owner: hutan_kita_user
--

CREATE INDEX social_forest_permits_village_id ON public."SocialForestPermits" USING btree ("villageId");


--
-- Name: BiophysicalProfiles BiophysicalProfiles_permitId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."BiophysicalProfiles"
    ADD CONSTRAINT "BiophysicalProfiles_permitId_fkey" FOREIGN KEY ("permitId") REFERENCES public."SocialForestPermits"(id) ON DELETE CASCADE;


--
-- Name: BusinessReadiness BusinessReadiness_institutionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."BusinessReadiness"
    ADD CONSTRAINT "BusinessReadiness_institutionId_fkey" FOREIGN KEY ("institutionId") REFERENCES public."Institutions"(id) ON DELETE CASCADE;


--
-- Name: CarryingCapacity CarryingCapacity_permitId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."CarryingCapacity"
    ADD CONSTRAINT "CarryingCapacity_permitId_fkey" FOREIGN KEY ("permitId") REFERENCES public."SocialForestPermits"(id) ON DELETE CASCADE;


--
-- Name: CommoditySuitabilities CommoditySuitabilities_commodityId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."CommoditySuitabilities"
    ADD CONSTRAINT "CommoditySuitabilities_commodityId_fkey" FOREIGN KEY ("commodityId") REFERENCES public."Commodities"(id) ON DELETE CASCADE;


--
-- Name: CommoditySuitabilities CommoditySuitabilities_permitId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."CommoditySuitabilities"
    ADD CONSTRAINT "CommoditySuitabilities_permitId_fkey" FOREIGN KEY ("permitId") REFERENCES public."SocialForestPermits"(id) ON DELETE CASCADE;


--
-- Name: DerivedProducts DerivedProducts_commodityId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."DerivedProducts"
    ADD CONSTRAINT "DerivedProducts_commodityId_fkey" FOREIGN KEY ("commodityId") REFERENCES public."Commodities"(id) ON DELETE CASCADE;


--
-- Name: Districts Districts_regencyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."Districts"
    ADD CONSTRAINT "Districts_regencyId_fkey" FOREIGN KEY ("regencyId") REFERENCES public."Regencies"(id) ON DELETE CASCADE;


--
-- Name: EnvironmentalRisks EnvironmentalRisks_permitId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."EnvironmentalRisks"
    ADD CONSTRAINT "EnvironmentalRisks_permitId_fkey" FOREIGN KEY ("permitId") REFERENCES public."SocialForestPermits"(id) ON DELETE CASCADE;


--
-- Name: GroupDemographics GroupDemographics_institutionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."GroupDemographics"
    ADD CONSTRAINT "GroupDemographics_institutionId_fkey" FOREIGN KEY ("institutionId") REFERENCES public."Institutions"(id) ON DELETE CASCADE;


--
-- Name: InstitutionContacts InstitutionContacts_institutionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."InstitutionContacts"
    ADD CONSTRAINT "InstitutionContacts_institutionId_fkey" FOREIGN KEY ("institutionId") REFERENCES public."Institutions"(id) ON DELETE CASCADE;


--
-- Name: InstitutionMembers InstitutionMembers_institutionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."InstitutionMembers"
    ADD CONSTRAINT "InstitutionMembers_institutionId_fkey" FOREIGN KEY ("institutionId") REFERENCES public."Institutions"(id) ON DELETE CASCADE;


--
-- Name: Institutions Institutions_institutionTypeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."Institutions"
    ADD CONSTRAINT "Institutions_institutionTypeId_fkey" FOREIGN KEY ("institutionTypeId") REFERENCES public."InstitutionTypes"(id);


--
-- Name: MarketData MarketData_buyerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."MarketData"
    ADD CONSTRAINT "MarketData_buyerId_fkey" FOREIGN KEY ("buyerId") REFERENCES public."Buyers"(id);


--
-- Name: MarketData MarketData_commodityId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."MarketData"
    ADD CONSTRAINT "MarketData_commodityId_fkey" FOREIGN KEY ("commodityId") REFERENCES public."Commodities"(id) ON DELETE CASCADE;


--
-- Name: MarketData MarketData_permitId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."MarketData"
    ADD CONSTRAINT "MarketData_permitId_fkey" FOREIGN KEY ("permitId") REFERENCES public."SocialForestPermits"(id);


--
-- Name: MonitoringLogs MonitoringLogs_permitId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."MonitoringLogs"
    ADD CONSTRAINT "MonitoringLogs_permitId_fkey" FOREIGN KEY ("permitId") REFERENCES public."SocialForestPermits"(id) ON DELETE CASCADE;


--
-- Name: PermitCommodities PermitCommodities_commodityId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."PermitCommodities"
    ADD CONSTRAINT "PermitCommodities_commodityId_fkey" FOREIGN KEY ("commodityId") REFERENCES public."Commodities"(id) ON DELETE CASCADE;


--
-- Name: PermitCommodities PermitCommodities_permitId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."PermitCommodities"
    ADD CONSTRAINT "PermitCommodities_permitId_fkey" FOREIGN KEY ("permitId") REFERENCES public."SocialForestPermits"(id) ON DELETE CASCADE;


--
-- Name: PermitForestStatuses PermitForestStatuses_permitId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."PermitForestStatuses"
    ADD CONSTRAINT "PermitForestStatuses_permitId_fkey" FOREIGN KEY ("permitId") REFERENCES public."SocialForestPermits"(id) ON DELETE CASCADE;


--
-- Name: PermitForestStatuses PermitForestStatuses_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."PermitForestStatuses"
    ADD CONSTRAINT "PermitForestStatuses_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."ForestAreaStatuses"(id) ON DELETE CASCADE;


--
-- Name: PermitLandCovers PermitLandCovers_landCoverTypeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."PermitLandCovers"
    ADD CONSTRAINT "PermitLandCovers_landCoverTypeId_fkey" FOREIGN KEY ("landCoverTypeId") REFERENCES public."LandCoverTypes"(id);


--
-- Name: PermitLandCovers PermitLandCovers_permitId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."PermitLandCovers"
    ADD CONSTRAINT "PermitLandCovers_permitId_fkey" FOREIGN KEY ("permitId") REFERENCES public."SocialForestPermits"(id) ON DELETE CASCADE;


--
-- Name: PriorityScores PriorityScores_permitId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."PriorityScores"
    ADD CONSTRAINT "PriorityScores_permitId_fkey" FOREIGN KEY ("permitId") REFERENCES public."SocialForestPermits"(id) ON DELETE CASCADE;


--
-- Name: ProductionRecords ProductionRecords_commodityId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."ProductionRecords"
    ADD CONSTRAINT "ProductionRecords_commodityId_fkey" FOREIGN KEY ("commodityId") REFERENCES public."Commodities"(id) ON DELETE CASCADE;


--
-- Name: ProductionRecords ProductionRecords_permitId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."ProductionRecords"
    ADD CONSTRAINT "ProductionRecords_permitId_fkey" FOREIGN KEY ("permitId") REFERENCES public."SocialForestPermits"(id) ON DELETE CASCADE;


--
-- Name: Regencies Regencies_provinceId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."Regencies"
    ADD CONSTRAINT "Regencies_provinceId_fkey" FOREIGN KEY ("provinceId") REFERENCES public."Provinces"(id) ON DELETE CASCADE;


--
-- Name: SocialForestPermits SocialForestPermits_institutionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."SocialForestPermits"
    ADD CONSTRAINT "SocialForestPermits_institutionId_fkey" FOREIGN KEY ("institutionId") REFERENCES public."Institutions"(id);


--
-- Name: SocialForestPermits SocialForestPermits_schemeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."SocialForestPermits"
    ADD CONSTRAINT "SocialForestPermits_schemeId_fkey" FOREIGN KEY ("schemeId") REFERENCES public."PSSchemes"(id);


--
-- Name: SocialForestPermits SocialForestPermits_villageId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."SocialForestPermits"
    ADD CONSTRAINT "SocialForestPermits_villageId_fkey" FOREIGN KEY ("villageId") REFERENCES public."Villages"(id);


--
-- Name: SupplyChainNodes SupplyChainNodes_commodityId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."SupplyChainNodes"
    ADD CONSTRAINT "SupplyChainNodes_commodityId_fkey" FOREIGN KEY ("commodityId") REFERENCES public."Commodities"(id) ON DELETE CASCADE;


--
-- Name: Villages Villages_districtId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hutan_kita_user
--

ALTER TABLE ONLY public."Villages"
    ADD CONSTRAINT "Villages_districtId_fkey" FOREIGN KEY ("districtId") REFERENCES public."Districts"(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict owK8acSdouugqC9eHMcgsVZ0WuSMl6dpkoXLk7SC5k38ghCOeoPNx77ToIAakb7

